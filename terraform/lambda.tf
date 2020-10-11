resource "aws_lambda_function" "event_putter_lambda" {
  function_name = "event_putter_lambda"
  description = "This lambada puts events to AWS EventBridge's Event Bus."
  handler = "event_putter.lambda_handle"
  filename = data.archive_file.event_putter_lambda_zip.output_path
  source_code_hash = data.archive_file.event_putter_lambda_zip.output_base64sha256
  role = aws_iam_role.lambda_put_events_to_event_bus_role.arn
  runtime = "python3.6"
  timeout = 10
  layers = [aws_lambda_layer_version.lambda_layer_boto3.arn]
}

resource "aws_lambda_function" "event_receiver_lambda" {
  function_name = var.eventbridge_target_lambda_name
  description = "This lambda is a target for an AWS EventBridge Rule."
  handler = "event_receiver.lambda_handle"
  filename = data.archive_file.event_receiver_lambda_zip.output_path
  source_code_hash = data.archive_file.event_receiver_lambda_zip.output_base64sha256
  role = aws_iam_role.lambda_put_item_to_dynamodb.arn
  runtime = "python3.6"
  timeout = 10
  layers = [aws_lambda_layer_version.lambda_layer_boto3.arn]
}

resource "aws_lambda_permission" "event_bus_rule_invoke_lambda" {
  statement_id = "AllowEventsToInvokeLambda"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.event_receiver_lambda.function_name
  principal = "events.amazonaws.com"
  source_arn = aws_cloudwatch_event_rule.event_rule.arn
}

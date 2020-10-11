resource "aws_iam_role" "lambda_put_events_to_event_bus_role" {
  name = "LambdaPutEventsToEventBus"
  assume_role_policy = data.aws_iam_policy_document.lambda_role_document.json
}

resource "aws_iam_role" "lambda_put_item_to_dynamodb" {
  name = "LambdaPutItemToDynamoDB"
  assume_role_policy = data.aws_iam_policy_document.lambda_role_document.json
}

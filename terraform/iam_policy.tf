resource "aws_iam_role_policy" "put_events_inline_policy" {
  name   = "PutEvenstInlinePolicy"
  role   = aws_iam_role.lambda_put_events_to_event_bus_role.id
  policy = data.aws_iam_policy_document.put_events_policy_document.json
}

resource "aws_iam_role_policy" "dynamodb_put_item_inline_policy" {
  name   = "DynamoDBPutItemInlinePolicy"
  role   = aws_iam_role.lambda_put_item_to_dynamodb.id
  policy = data.aws_iam_policy_document.dynamodb_put_item_policy_document.json
}

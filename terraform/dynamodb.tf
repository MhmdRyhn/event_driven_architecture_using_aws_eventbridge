resource "aws_dynamodb_table" "eventbridge_demo_table" {
  name           = "${local.resource_name_prefix}-${local.dynamodb_table_name}"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10

  hash_key = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Application = var.prefix
    Environment = var.environment
  }
}

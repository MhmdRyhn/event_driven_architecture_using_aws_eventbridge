locals {
  resource_name_prefix = "${var.prefix}-${var.environment}"
  python_runtime       = "python3.6"
  dynamodb_table_name  = "eventbridge_demo_table"
}

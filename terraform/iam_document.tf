data "aws_iam_policy_document" "lambda_role_document" {
  version = "2012-10-17"
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
    sid = "LambdaExecutionRole"
  }
}

data "aws_iam_policy_document" "put_events_policy_document" {
  version = "2012-10-17"
  statement {
    effect    = "Allow"
    actions   = ["events:PutEvents"]
    resources = ["*"] // Should be specific ARN
  }
}

data "aws_iam_policy_document" "dynamodb_put_item_policy_document" {
  version = "2012-10-17"
  statement {
    effect    = "Allow"
    actions   = ["dynamodb:PutItem"]
    resources = ["*"] // Should be specific ARN
  }
}

data "aws_iam_policy_document" "kms_decryption_policy_document" {
  version = "2012-10-17"
  statement {
    effect    = "Allow"
    actions   = ["kms:Decrypt"]
    resources = ["*"] // Should be specific ARN
  }
}

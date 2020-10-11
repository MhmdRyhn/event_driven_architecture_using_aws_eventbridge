variable "aws_profile" {
  type = string
  description = "Name of the profile stored in ~/.aws/credentials file."
  default = "dev"
}

variable "aws_region" {
  type = string
  description = "Name of the aws region."
  default = "us-east-2"
}

variable "eventbridge_target_lambda_name" {
  type = string
  description = "Name of the AWS Lambda function that is to be used as eventbridge target."
}

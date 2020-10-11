variable "aws_profile" {
  type        = string
  description = "Name of the profile stored in ~/.aws/credentials file."
}

variable "aws_region" {
  type        = string
  description = "Name of the aws region."
}

variable "prefix" {
  type        = string
  description = "A prefix that is to be used with the resource name. Usually, this should be the application name."
}

variable "environment" {
  type        = string
  description = "Environment name, e.g., Dev, Test, Stage, UAT, Prod etc."
}

variable "eventbridge_target_lambda_name" {
  type        = string
  description = "Name of the AWS Lambda function that is to be used as eventbridge target."
}

terraform {
  required_providers {
    aws = {
      version = ">= 3.10.0"
      source = "hashicorp/aws"
    }
    archive = {
      version = ">= 1.3.0"
      source = "hashicorp/archive"
    }
  }
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

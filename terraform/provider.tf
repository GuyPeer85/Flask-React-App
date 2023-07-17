terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region           = "us-east-1"
  access_key       = var.aws_access_key
  secret_access_key = var.aws_secret_access_key
}

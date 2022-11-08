///// Terraform Cloud Provider ///// 
terraform {
  cloud {
    organization = "rajivgopal-tfc"
    workspaces {
      name = "learn-tfc-aws"
    }
  }
}

///// AWS Provider ///// 
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.38.0"
    }
  }
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_access_key
  region     = var.aws_region
}
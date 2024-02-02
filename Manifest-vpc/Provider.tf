# Terraform Block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# Provider-1 for us-east-1 (Default Provider)
provider "aws" {
  region = "eu-central-1"
  profile = "default"
}

# Provider-2 for us-west-1
provider "aws" {
  region = "eu-west-1"
  profile = "default"
  alias = "aws-vpn-westalias"
}
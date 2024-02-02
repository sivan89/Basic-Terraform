# Terraform Settings Block
terraform {
  # Terraform Version
  # required_version = "~> 1.3.0"
  required_providers {
    # AWS Provider 
    aws = {
      source  = "hashicorp/aws"
      #version = "= 2.50.0"
    }
    # Random Provider
    random = {
      source  = "hashicorp/random"
      #version = "3.0.0"
    }
  }
}

# Provider Block
provider "aws" {
  region = "eu-central-1"
  profile = "default" # Defining it for default profile is Optional
}
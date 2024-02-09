terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.35.0"
    }
  }
  backend "s3" {
    bucket = "myterraformststartfile2023"
    key    = "terraformstatefile/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-tfstate"
  }
}


provider "aws" {
  region = "eu-central-1"
  # Configuration options
}
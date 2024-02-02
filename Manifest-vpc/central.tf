# Resource Block to Create VPC in us-east-1 which uses default provider
resource "aws_vpc" "vpc-eu-central-1" {
  cidr_block = "10.1.0.0/16"
  provider = aws
  tags = {
    "Name" = "vpc-eu-central-1"
  }
}
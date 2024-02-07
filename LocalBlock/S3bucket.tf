#Define Local Values
locals {
  bucket-name = "${var.app_name}-${var.environment_name}" # Complex expression
}

#Create S3 Bucket 1 - with Input Variables & Local Values
resource "aws_s3_bucket" "mys3bucket01" {
  bucket = "${local.bucket-name}-s3bucket-01"
  tags = {
    Name        = local.bucket-name
    Environment = var.environment_name
  }
}


#Create S3 Bucket 2 - with Input Variables & Local Values
resource "aws_s3_bucket" "mys3bucket02" {
  bucket = "${local.bucket-name}-s3bucket-02"
  tags = {
    Name        = local.bucket-name
    Environment = var.environment_name
  }
}
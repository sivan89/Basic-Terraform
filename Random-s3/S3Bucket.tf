# Resource Block: Create Random Pet Name 
resource "random_pet" "petname" {
  length    = 5
  separator = "-"
}

# Resource Block: Create AWS S3 Bucket
#resource "aws_s3_bucket" "sample" {
#  bucket = random_pet.petname.id
#  acl    = "public-read"
#  region = "eu-central-1"  # Comment this if we are going to use AWS Provider v3.x version
#}


resource "aws_s3_bucket" "sample" {
  bucket = random_pet.petname.id
}

resource "aws_s3_bucket_public_access_block" "blockaccess" {
  bucket = aws_s3_bucket.sample.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "control" {
  bucket = aws_s3_bucket.sample.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "sample" {
  depends_on = [
	aws_s3_bucket_public_access_block.blockaccess,
	aws_s3_bucket_ownership_controls.control,
  ]

  bucket = aws_s3_bucket.sample.id
  acl    = "public-read"
}
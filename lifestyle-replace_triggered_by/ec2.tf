# Create EC2 Instance
resource "aws_instance" "bmw" {
  ami               = "ami-0faab6bdbac9486fb" # Amazon Linux
  instance_type     = "t2.medium"
  availability_zone = "eu-central-1b"
  tags = {
    "Name" = "BMW"
  }
  lifecycle {
    replace_triggered_by = [ aws_s3_bucket.sample ]
  }
}

resource "aws_s3_bucket" "sample" {
  bucket = "mysql-785647321-add-updated"
  tags = {
    "Name" = "BMW"
  }
}
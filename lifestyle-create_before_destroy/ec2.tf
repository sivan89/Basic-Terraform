# Create EC2 Instance
resource "aws_instance" "bmw" {
  ami               = "ami-0faab6bdbac9486fb" # Amazon Linux
  instance_type     = "t2.medium"
  availability_zone = "eu-central-1b"
  tags = {
    "Name" = "BMW"
  }
  lifecycle {
    create_before_destroy = true # Default is false
  }
}

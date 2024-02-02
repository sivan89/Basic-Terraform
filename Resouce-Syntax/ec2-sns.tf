# Create EC2 Instance
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance


resource "aws_sns_topic" "notification" {
  name = "Restart-MyEC2"
  
}

resource "aws_instance" "my-ec2-vm" {
  ami               = "ami-0faab6bdbac9486fb"
  instance_type     = "t2.micro"
  availability_zone = "eu-central-1a"
  tags = {
    "Name" = "Benz_Testing"
    "Type" = "HMI-test-env"    
  }
}
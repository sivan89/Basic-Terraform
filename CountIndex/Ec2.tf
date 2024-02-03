# Create EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-0faab6bdbac9486fb" # Amazon Linux
  instance_type = "t2.micro"
  count         = 2
  tags = {
    #"Name" = "web"
    "Name" = "web-${count.index}"
  }
}
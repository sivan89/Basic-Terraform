# Create EC2 Instance
resource "aws_instance" "web" {
  ami                         = var.amiid
  count                       = var.ec2config[0]
  instance_type               = var.ec2config[1]
  associate_public_ip_address = var.ec2config[2]
  tags                        = var.tag
}
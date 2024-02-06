# Create EC2 Instance
resource "aws_instance" "web" {
  ami                         = var.amiid
  instance_type               = var.ec2config[1]
  count                       = var.ec2config[0]
  associate_public_ip_address = var.ec2config[2]
  
  tags = var.xyz
  /* tags = {
    #"Name" = "web"
    "Name" = "web-${count.index}"
    "Env"  = "${var.ec2config[3]}"
    "ec2tag"  =  var.ec2tag
    } */
}
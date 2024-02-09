data "aws_vpc" "get_vpc_id" {
  filter {
    name   = "tag:Name"
    values = ["SMART_ORG"]
  }
}

data "aws_subnet" "get_subnet_id" {
  filter {
    name   = "tag:Name"
    values = ["SMART_BENZ_Public"]
  }
}

data "aws_security_group" "get_security_group_id" {
  id = var.security_group_id
}

resource "aws_instance" "terra_ec2" {
  ami                         = "ami-02fe204d17e0189fb"
  instance_type               = "t2.micro"
  key_name                    = "SMART"
  subnet_id                   = data.aws_subnet.get_subnet_id.id
  associate_public_ip_address = true
  availability_zone           = "eu-central-1a"
  vpc_security_group_ids      = [data.aws_security_group.get_security_group_id.id]
  root_block_device {
    volume_size           = 20
    volume_type           = "gp2"
    delete_on_termination = true
  }
  user_data = <<-EOF
        #!/bin/bash
        sudo apt update
        sudo apt install apache2 -y
        sudo systemctl enable apache2
        sudo systemctl start apache2
        EOF

  tags = {
    "Name" = "Cheking_again"
  }

}

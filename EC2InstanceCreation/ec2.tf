resource "aws_instance" "audiec21" {
    ami = "ami-0faab6bdbac9486fb"
    instance_type = "t2.micro"
    key_name = "SMART"
    subnet_id = aws_subnet.audisubnet.id
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.audisecurity.id]
    root_block_device {
      volume_size = 20
      volume_type = "gp2"
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
      "Name" = "AUDI-EC2-SYSTEM-01"
    }

}

resource "aws_ebs_volume" "audiebsv" {
  type = "gp2"  
  size = 10
  availability_zone = aws_instance.audiec21.availability_zone
  tags = {
    "Environment" = "audiebsv"
  }
  
}

resource "aws_volume_attachment" "terra-volume-attachemnt" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.audiebsv.id
  instance_id = aws_instance.audiec21.id
}
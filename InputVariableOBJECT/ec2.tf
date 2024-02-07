resource "aws_instance" "thulasiec2" {
  ami                         = var.amiid
  instance_type               = var.typeofins[0]
  count                       = var.numofins
  key_name                    = "SMART"
  subnet_id                   = aws_subnet.thulasisubnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.tsgssh.id, aws_security_group.tsgweb.id]
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

  tags = var.tags

}

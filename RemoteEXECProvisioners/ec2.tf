# Create EC2 Instance - Amazon2 Linux
resource "aws_instance" "my-ec2-vm" {
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.instance_type
  key_name               = "SMART"
  user_data              = file("apache-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "vm-dev-0"
  }

  connection {
    type        = "ssh"
    host        = "3.67.169.242"
    user        = "ec2-user"
    password    = ""
    private_key = file("pv-keys/SMART.pem")
  }

  provisioner "file" {
    content     = "ami used: ${self.ami} , ${self.public_ip}" # Understand what is "self"
    destination = "/tmp/file.log"
  }


  provisioner "file" {
    source      = "apps/file-copy.html"
    destination = "/tmp/file-copy.html"
  }

# Copies the file to Apache Webserver /var/www/html directory
  provisioner "remote-exec" {
    inline = [
      "sleep 30", 
      "sudo cp /tmp/file-copy.html /var/www/html"
    ]

}
}






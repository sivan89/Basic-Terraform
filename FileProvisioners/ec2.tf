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
    host        = self.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("pv-keys/SMART.pem")
  }

  #  # Copies the file-copy.html file to /tmp/file-copy.html
  #   provisioner "file" {
  #     source      = "apps/file-copy.html"
  #     destination = "/tmp/file-copy.html"
  #   }

  #   # Copies the string in content into /tmp/file.log
  provisioner "file" {
    content     = "ami used: ${self.ami} , ${self.public_ip}" # Understand what is "self"
    destination = "/tmp/file.log"
  }


  #   # Copies all files and folders in apps/app2 to /tmp - CONTENTS of FOLDER WILL BE COPIED
  #   provisioner "file" {
  #     source      = "apps/app2/" # when "/" at the end is added - CONTENTS of FOLDER WILL BE COPIED
  #     destination = "/tmp"
  #   }

  provisioner "file" {
    source      = "apps/file-copy.html"
    destination = "/var/www/html/file-copy.html"
    on_failure  = continue
  }

  # Copies the app1 folder to /tmp - FOLDER COPY
  provisioner "file" {
    source      = "apps/app1"
    destination = "/tmp"
  }

}






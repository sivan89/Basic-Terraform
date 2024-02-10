# Create EC2 Instance - Amazon2 Linux
locals {
  instance_type = lookup(
    {
      app = "t2.micro"
      web = "t2.nano"
      db  = "t3.large"
    },
    var.app_type,
    "t2.nano"
  )
}

resource "aws_instance" "my-ec2-vm" {
  ami           = "ami-02fe204d17e0189fb"
  instance_type = local.instance_type
  key_name      = "SMART"
  user_data = templatefile("user_data.tmpl", {
    package_name        = var.package_name
    second_package_name = var.second_package_name
  })

  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "TF-Functions-Demo-1"
  }
}

resource "aws_vpc" "thulasivpc" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "thulasi-VPC-TEST-ENV"
  }
}

resource "aws_subnet" "thulasisubnet" {
  vpc_id     = aws_vpc.thulasivpc.id
  cidr_block = "192.168.1.0/24"

  tags = {
    Name = "thulasi-SUBNET-TEST-ENV"
  }
}

resource "aws_route_table" "thulasirouttable" {
  vpc_id = aws_vpc.thulasivpc.id

  route {
    cidr_block = "192.168.0.0/16"
    gateway_id = "local"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.audigw.id
  }

  tags = {
    Name = "thulasi-RT-TEST-ENV"
  }
}

resource "aws_route_table_association" "audirtswithsubnet" {
  subnet_id      = aws_subnet.thulasisubnet.id
  route_table_id = aws_route_table.thulasirouttable.id
}

resource "aws_internet_gateway" "audigw" {
  vpc_id = aws_vpc.thulasivpc.id

  tags = {
    Name = "tulasi-IG-TEST-ENV"
  }
}

resource "aws_security_group" "tsgweb" {
  name   = "thulasi-SG-web-ENV"
  vpc_id = aws_vpc.thulasivpc.id

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Environment" = "thulasi-medical-web"
  }
}


resource "aws_security_group" "tsgssh" {
  name   = "thulasi-SG-ssh-ENV"
  vpc_id = aws_vpc.thulasivpc.id
  ingress {
    description = "Allow Port 80"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Environment" = "thulasi-medical-ssh"
  }

}
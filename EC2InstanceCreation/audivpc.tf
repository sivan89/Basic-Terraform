
resource "aws_vpc" "audivpc" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "AUDI-VPC-TEST-ENV"
  }
}

resource "aws_subnet" "audisubnet" {
  vpc_id     = aws_vpc.audivpc.id
  cidr_block = "192.168.1.0/24"

  tags = {
    Name = "AIDI-SUBNET-TEST-ENV"
  }
}

resource "aws_route_table" "audirouttable" {
  vpc_id = aws_vpc.audivpc.id

route {
    cidr_block = "192.168.0.0/16"
    gateway_id   = "local"
  }
 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.audigw.id
  }

  tags = {
    Name = "AIDI-RT-TEST-ENV"
  }
}

resource "aws_route_table_association" "audirtswithsubnet" {
  subnet_id      = aws_subnet.audisubnet.id
  route_table_id = aws_route_table.audirouttable.id
}

resource "aws_internet_gateway" "audigw" {
  vpc_id = aws_vpc.audivpc.id

  tags = {
    Name = "AIDI-IG-TEST-ENV"
  }
}

resource "aws_security_group" "audisecurity" {
  name   = "AIDI-SG-TEST-ENV"
  vpc_id = aws_vpc.audivpc.id

  ingress = [{
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Inbound Terraform Security Group"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
    
  },
  {
    protocol = -1
    from_port = 0
    to_port = 0
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Outbound Terraform Security Group"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false 
  },
  {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Inbound Terraform Security Group"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false 
  }]
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
   "Environment" = "DEV"
 }
}



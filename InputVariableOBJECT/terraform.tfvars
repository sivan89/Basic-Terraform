numofins  = 1
typeofins = ["t2.micro", "t3.small", "t3.large"]
amiid     = "ami-0faab6bdbac9486fb"

ingress_rules = [{
  description      = "Allow Port 80"
  from_port        = 22
  to_port          = 22
  protocol         = "tcp"
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = []
  prefix_list_ids  = []
  security_groups  = []
  self             = false
}]
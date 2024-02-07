variable "numofins" {
  type        = number
  description = "number of ins for thulasi medical"
}

variable "typeofins" {
  type        = list(string)
  description = "what kind of instance"
}

variable "amiid" {
  type        = string
  description = "ami id for thulasi medical"
}

variable "ingress_rules" {
  type = list(object({
    description      = string
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
    prefix_list_ids  = list(string)
    security_groups  = list(string)
    self             = bool
  }))
}


variable "tags" {
  type = object({
    Name     = string
    Env      = string
    NumOfIns = number
  })
  description = "ami id for thulasi medical"
}

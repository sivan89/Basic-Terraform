variable "location" {
  type = string
}

variable "amiid" {
  type = string
}

variable "ec2config" {
  type = tuple([number, string, bool, string])
}

variable "ec2tag" {
  type = string
  
}


variable "xyz" {
  type = object({
       Hello = string
    usercount = number
    both  = string
  })  
}
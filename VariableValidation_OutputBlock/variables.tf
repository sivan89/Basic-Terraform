variable "location" {
  type = string
}

variable "amiid" {
  type = string
  validation {
    condition = substr(var.amiid,0,3) == "ami" &&  length(var.amiid) > 4
    error_message = " Condiftion not Match "
  }
}

variable "ec2ins" {
  type = string
  validation {
    condition     = var.ec2ins == "t2.micro"
    error_message = "EC2 Instance type Should be t2.micro"
  }

}

variable "ec2config" {
  type = tuple([number, string, bool])
}

variable "tag" {
  type      = map(string)
  sensitive = true
}
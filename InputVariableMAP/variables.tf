variable "location" {
  type = string
}

variable "amiid" {
  type = string
}

variable "ec2config" {
  type = tuple([number, string, bool, string])
}

variable "tag" {
  type = map(string)
}
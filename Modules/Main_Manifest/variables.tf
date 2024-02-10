variable "location" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "amiid" {
  type = string
}

variable "ins_type" {
  type = string
}

variable "tags" {
  type = map(string)
}
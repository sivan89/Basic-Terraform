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

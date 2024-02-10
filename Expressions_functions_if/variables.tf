variable "location" {
  type = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t2.micro"
}

variable "availability_zones" {
  description = "List of Availability Zones resources will be created"
  type = list(string)
  default = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}

variable "high_availability" {
  type        = bool
  description = "If this is a multiple instance deployment, choose `true` to deploy 2 instances"
  #default     = false
  default     = true
}


variable "name" {
  description = "The username assigned to the infrastructure"
  type = string 
}

variable "team" {
  description = "The team responsible for the infrastructure"
  type = string
  default     = "terraformcourse"
}

variable "number_of_instances" {
  type = number
}
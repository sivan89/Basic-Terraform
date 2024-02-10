
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
}

variable "app_type" {
  description = "EC2 Instance Type - Instance Sizing"
  type        = string
}


variable "package_name" {
  description = "Provide Package that need to be installed with user_data"
  type        = string
}

variable "second_package_name" {
  description = "Provide Package that need to be installed with user_data"
  type        = string
}
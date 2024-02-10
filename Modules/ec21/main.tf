module "ec21" {
source = "../Main_Manifest"
location          = "eu-central-1"
security_group_id = "sg-0bcdc5813649b5ac1"
tags = {"Name" = "Ubuntu"}
ins_type = "t2.micro"
amiid = "ami-0faab6bdbac9486fb"
}
resource "aws_instance" "cloudami" {
    ami                                  = "ami-02fe204d17e0189fb"
    instance_type                        = "t2.micro"
    key_name                             = "SMART"
    tags                                 = {
        "Name" = "cloudwatch"
    }
}
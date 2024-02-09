resource "aws_s3_bucket" "importbucket" {
    bucket                      = "myterraformststartfile2023"
    object_lock_enabled         = false
    tags                        = {
        "Name" = "Terraform"
    }

}
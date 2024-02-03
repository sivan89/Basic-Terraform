resource "aws_s3_bucket" "mys3bucket" {
  # for_each Meta-Argument
  for_each = {
    dev      = "my-devapp-bucket-157673692367"
    prod     = "my-prodapp-bucket-157673692367"
    ut       = "my-utapp-bucket-157673692367"
    coverity = "my-coverityapp-bucket-157673692367"
  }
  bucket = "${each.key}-${each.value}"

  tags = {
    Environment = each.key
    bucketname  = "${each.key}-${each.value}"
    eachvalue   = each.value
  }
}
resource "aws_iam_user" "devtest" {
  for_each = var.listuser
  name     = each.value
}
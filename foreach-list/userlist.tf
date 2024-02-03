resource "aws_iam_user" "myuser" {
  for_each = toset(["Love", "You", "Mine", "Ours"])
  #name     = each.value
  name = "dev-$(each.value)"
}
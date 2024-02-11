output "securigrupe" {
  value = aws_security_group.sg-dynamic1.arn
}

output "securigruperulelist" {
  value = [for xyz in aws_security_group.sg-dynamic1.ingress : xyz.protocol]
}

 output "securigruperulemap" {
  value = [for test in aws_security_group.sg-dynamic1.ingress : test.to_port]
}

 output "securigruperulelove" {
  value = {for love in aws_security_group.sg-dynamic1.ingress : love.from_port => [love.protocol , love.to_port]}
}
locals {
    from_port = {80 = [80,"tcp",["0.0.0.0/0"]] ,443 = [443,"tcp",["0.0.0.0/0","0.0.0.0/8"]], 8080 = [8080,"tcp",["0.0.0.0/0"]] ,8081 = [8081,"tcp",["0.0.0.0/0"]]}
}

resource "aws_security_group" "sg-dynamic1" {
  name        = "demo-regular1"
  description = "demo-regular1"

  dynamic "ingress" {
    for_each = local.from_port
    content {
        description = "description ${ingress.key}"
        from_port   = ingress.key
        to_port     = ingress.value[0]
        protocol    = ingress.value[1]
        cidr_blocks = ingress.value[2]
    }

  }
}
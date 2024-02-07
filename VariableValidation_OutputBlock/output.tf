output "display_ami" {
  value = aws_instance.web.ami
}

output "diaplay_pub_ip" {
  value = aws_instance.web.public_ip

}

output "display_tag" {
  value = aws_instance.web.tags_all
}

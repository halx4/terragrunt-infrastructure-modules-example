output "ami_id" {
  value = "${aws_security_group.allow_all_security_group.id}"
}

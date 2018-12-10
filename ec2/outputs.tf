output "ami_id" {
  value = "${aws_instance.web.arn}"
}

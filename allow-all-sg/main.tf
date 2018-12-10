# ---------------------------------------------------------------------------------------------------------------------
# A SIMPLE EXAMPLE OF HOW DEPLOY AN ASG WITH AN ELB IN FRONT OF IT
# This is an example of how to use Terraform to deploy an Auto Scaling Group (ASG) with an Elastic Load
# Balancer (ELB) in front of it. To keep the example simple, we deploy a vanilla Ubuntu AMI across the ASG and run a
# dirt simple "web server" on top of it as a User Data script. The "web server" always returns "Hello, World".
#
# Note: This code is meant solely as a simple demonstration of how to lay out your files and folders with Terragrunt
# in a way that keeps your Terraform code DRY. This is not production-ready code, so use at your own risk.
# ---------------------------------------------------------------------------------------------------------------------

provider "aws" {
  region = "${var.aws_region}"
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}


resource "aws_security_group" "allow_all_security_group" {
  name = "sg-allow-all-instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
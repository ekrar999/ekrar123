provider "aws" {
  region     = "us-east-2"
  access_key = "AKIA2QIX6LCKI64TUBGD"
  secret_key = "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"
}

resource "aws_instance" "web" {
  ami = "ami-0521a1ab6cb98215d"
  instance_type = "t2.micro"
}

resource "aws_eip" "lb" {
  domain   = "vpc"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.lb.id
}
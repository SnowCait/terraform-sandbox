terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {}

resource "aws_instance" "jenkins" {
  count = 0

  ami           = "ami-0b313cea00b6ad211"
  instance_type = "t2.micro"

  tags = {
    Name = "Jenkins ${count.index}"
  }
}

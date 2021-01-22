terraform {
  backend "s3" {
    bucket  = "snow-terraform-jenkins"
    key     = "jenkins/terraform.tfstate"
    profile = "sandbox"
    region  = "ap-northeast-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = "sandbox"
  region  = "ap-northeast-1"
}

resource "aws_instance" "jenkins" {
  ami                    = "ami-0b313cea00b6ad211"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0ff16fb5a5284eed7"]

  tags = {
    Name = "Jenkins"
  }
}

output "dns" {
  value = aws_instance.jenkins.public_dns
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {}

resource "aws_instance" "example" {
  count = 0
  
  ami           = "ami-02b658ac34935766f"
  instance_type = "t2.micro"
}

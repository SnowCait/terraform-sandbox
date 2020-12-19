terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}
# provider "aws" {
#   version = ">= 2.0"
#   region  = "ap-northeast-1"
# }

resource "aws_instance" "example" {
#   count         = 0
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

#   tags = {
#     Name = "${format("example-%02d", count.index + 1)}"
#   }
}

# resource "aws_instance" "sandbox" {
#   count         = 0
#   ami           = "ami-02b658ac34935766f"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "${format("sandbox-%02d", count.index + 1)}"
#   }
# }

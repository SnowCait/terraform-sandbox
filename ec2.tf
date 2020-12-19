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
  count = 1

  ami           = "ami-02b658ac34935766f"
  instance_type = "t2.micro"

  user_data = "curl -s https://raw.githubusercontent.com/actions/runner/automate/scripts/create-latest-svc.sh | bash -s SnowCait/terraform-sandbox"

  tags = {
    Name = "GitHub Actions ${count.index}"
  }
}

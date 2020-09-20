resource "aws_instance" "sandbox" {
  count         = 0
  ami           = "ami-02b658ac34935766f"
  instance_type = "t2.micro"

  tags = {
    Name = "${format("sandbox-%02d", count.index + 1)}"
  }
}

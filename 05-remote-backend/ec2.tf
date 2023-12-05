resource "aws_instance" "remote-app" {
  ami           = "ami-086e7126e24c09b4c"
  instance_type = "t2.micro"

  tags = {
    Name = "Linux_Server_Remote_Backend"
  }
}
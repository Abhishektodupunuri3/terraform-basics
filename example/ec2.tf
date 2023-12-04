resource "aws_instance" "web" {
    ami             = "ami-05d263152e74d2910"
    instance_type   = "t2.micro"

    tags  ={
        Name = "HELLOWORLD"
    }
}
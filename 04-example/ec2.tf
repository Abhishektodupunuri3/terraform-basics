resource "aws_instance" "web" {
    ami             = "ami-086e7126e24c09b4c"
    instance_type   = "t2.micro"

    tags  ={
        Name = "TerrafromServer"
    }
}
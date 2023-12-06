# CREATES EC2
resource "aws_instance" "web" {
    ami                     = "ami-086e7126e24c09b4c"
    instance_type           = "t2.micro"
    vpc_security_group_ids  = ["aws_security_group.allow_all.id"] 

    tags  ={
        Name = "TerrafromServer"
    }
}

# Creates a Security Group
resource "aws_security_group" "allow_all" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
# CREATES SECURITY GROUP
resource "aws_security_group" "allows_all" {
  name        = "allows_tls"
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
    Name = "allows_tls"
  }
}

# Step 1 : Declaring the output that we wish to pass to the root Module
output  "sgid" {
    value     =    aws_security_group.allows_all.id
  
}

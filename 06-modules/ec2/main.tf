# CREATES EC2
resource "aws_instance" "sample" {
    ami                     = "ami-086e7126e24c09b4c"
    instance_type           = "t2.micro"
    vpc_security_group_ids  = [var.sg]     
}

variable   "sg"  {}             # step 3 : Now to use this info, declare an empty variable and use it ( in root module, we have declared " sg = var.sgid )

output "public_ip"  {
    value = aws_instance.sample.public_ip
}
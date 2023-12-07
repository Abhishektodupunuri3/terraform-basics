# CREATES EC2
resource "aws_instance" "sample" {
    ami                     = data.aws_ami.image.id
    instance_type           = "t2.micro"
    vpc_security_group_ids  = [var.sg]   


    # This will be executed on the top of the machine once it's created
    provisioner "remote-exec" {

        # CONNECTION BLOCK ESTABLISHES CONNECTION TO THIS
        connection {
          type         =    "ssh"
          user         =    "centos"
          password     =    "DevOps321"
          host        =    self.private_ip                                     #aws_instance.sample.private_ip : use this only if your provisioner is outside the resource.agent. 
        }

        inline = [
            "ansible-pull -U https://github.com/Abhishektodupunuri3/ansible.git -e ENV=dev -e COMPONENT=mongodb"
        ]
    
    }  
}

variable   "sg"  {}             # step 3 : Now to use this info, declare an empty variable and use it ( in root module, we have declared " sg = var.sgid )

output "public_ip"  {
    value = aws_instance.sample.public_ip
}
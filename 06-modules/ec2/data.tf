data "aws_ami" "image" {
  most_recent      = true
  name_regex       = "ansible-lab-image"     # Ensure you make your own AMI from my labImage and install ANSIBLE on the top of it and then use your AMI Name
  owners           = ["self"]                 # we can use our acc id also so that it will search in our acc.count
}
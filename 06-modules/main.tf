/*
This is an example of calling modules for a local source and hence we call them as local modules
Modules can be in a separate repository or in the same directory where you actual code resides
You can also save your modules in a S3 Bucket and can call it accordinly.

Root Module : Is a place where we are going to execure the terraform commands.
 */

module "ec2" {
  source = "./ec2"
  sg     = module.sg.sgid                               # Step 2: Pass the output declared in the source module to this root module
}

module "sg" {
  source = "./sg"
}

output "public_ip_address" {
  value  = module.ec2.public_ip                          # This is going to fetch the declared output and prints
}
city     = "Bangalore"
coldcity = "OOTY"


# You can declare all the values or the default values in a file that ends with terraform.tfvars

# Any file that ends wiht .tfvars is the varaibles file with values in it.

# Terraform by default recognizes the the file with the name "terraform.tfvars" and if you declare variables in any other file apart from terraform.tfvars
# then you need to expplicitly mention that you're using this file as tfvars file

# Why we pass the values of a variable in a separate file ???

/* 
    We are going to create single terraform code and this should habe the capability to create multiple environments just based on supplying diffeent varaible files.

    Ex: prod.tfvars , sandbox.tfvars , qa.tfvars , test.tfvars, terraform.tfvars

*/


    variable "sample" {
        default = "Welcome To Terraform"
    }

    output "sample_output" {
        value = var.sample
    }

    variable "sample_op" {
        default = "Welcome to terraform training"
    }

    output "sample_var_op" {
        value = "Value of the variable is ${var.sample_op}"
    }

   # variable "test" {}  // Empty Variable

# A Variable can be accessed directly by calling it as var.variableName, but if you're accessing in between a set of strings, then you need to enclose them in quotes and it should referred using ${var.VarName}
# In Terraform there is no concept of Single Quotes. 


# list Variable 
variable "example_list" {   
    default = [
        "AWS",
        "DevOps",
         55,
        "Trainer" ,
        "Terraform"
    ]
}

# Try to understand here, the data in the list doesn't necessary to be of same data type. 

output "example_list_op" {
    value = "Welcome to ${var.example_list[1]}  with ${var.example_list[0]} Training and this is our batch ${var.example_list[2]} and the current topic is ${var.example_list[4]}"
}

# What is a map variable ? A variable with mutiple key value pairs is referred as Map Varaible

variable "example_map" {
    default = {
        Batch    = "B55"
        Training = "DevOpswithAWS"
        Mode     = "Online"
    }
}

output "example_map_op" {
    value = "We are learning ${var.example_map["Training"]} and this is our ${var.example_map["Batch"]} and the it is ${var.example_map["Mode"]} "
}
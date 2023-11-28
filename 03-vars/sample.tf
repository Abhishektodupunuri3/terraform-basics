# Declaring an empty variable city 

variable "city" {}

output "city_name" {
    value = "Our city name is ${var.city}"
}


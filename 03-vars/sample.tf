# Declaring an empty variable city 

variable "city" {}

output "city_name" {
    value = "Our city name is ${var.city}"
}

variable "state" {}



output "cold_city_output" {
    value = " cold city value is ${var.coldcity} "
}
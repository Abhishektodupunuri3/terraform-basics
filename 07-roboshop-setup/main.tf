module "frontend" {
    for_each    = var.COMPONENTS

    source      = "./ec2"
    COMPONENT   = each.key
    APP_VERSION = each.value.APP_VERSION
}

# module "mongodb" {
#     source      = "./ec2"
#     COMPONENT   = "mongodb"
#     APP_VERSION = "0.0.2"
# }

# module "cart" {
#     source      = "./ec2"
#     COMPONENT   = "cart"
#     APP_VERSION = "0.0.2"
# }

# module "catalogue" {
#     source      = "./ec2"
#     COMPONENT   = "catalogue"
#     APP_VERSION = "0.0.2"
# }
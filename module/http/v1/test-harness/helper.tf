# Load the main module:
module "main" {
  source = "../../v2"
}

output "vpc_cidr_block" {
  value = module.main.vpc_cidr_block 
}
output "tags" {
  value = module.main.tags
}
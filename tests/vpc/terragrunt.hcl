
terraform {
  source = "../../module/vpc"  # Adjust this to the path of your Terraform module
}

inputs = {
  aws_region = "us-east-1"
}

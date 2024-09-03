variable "aws_region" {
  default = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "mybucket-zoowj-20240901"
    key    = "key"
    region = var.aws_region
  }
}

provider "aws" {
  region = var.aws_region
}
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
    Da   = timestamp()
  }
}

# output "vpc_id" {
#   value = aws_vpc.main.id
# }

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}

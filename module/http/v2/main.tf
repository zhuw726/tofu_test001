provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main-vpc"
    Name1 = "main-vpc1"
    Name2 = "main-vpc2"
    Name3 = "main-vpc3"
  }
}


output "tags" {
  value = aws_vpc.main.tags
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}
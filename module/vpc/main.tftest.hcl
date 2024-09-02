run "test_vpc" {
  assert {
    condition     = aws_vpc.main.id != ""
    error_message = "VPC ID is empty, VPC may not have been created correctly."
  }

  assert {
    condition     = aws_vpc.main.cidr_block == "10.0.0.0/16"
    error_message = "VPC CIDR block is incorrect. Expected 10.0.0.0/16, got ${aws_vpc.main.cidr_block}."
  }
}

run "http" {
  # Load the test helper instead of the main module:
  module {
    # source = "./test-harness"
    source = "../../module/http/v1/test-harness"
  }

  # Check if the webserver returned an HTTP 200 status code:
  assert {
    condition     = output.vpc_cidr_block == "10.0.0.0/16"
    error_message = "Incorrect status code returned: ${output.vpc_cidr_block}"
  }
  assert {
    condition     = length(keys(output.tags)) == 4
    error_message = format("length(output.tags) >:  ${length(output.tags)}, %s ,%s,%s",
    jsonencode(output.tags),jsonencode(keys(output.tags)),jsonencode(values(output.tags)))
  }
  assert {
    condition     = contains(keys(output.tags), "Name3")
    error_message = format("contains(keys(output.tags), Name3): )")
  }
  assert {
    condition     = alltrue([
    for v in keys(output.tags) : contains(keys(output.tags), v)
  ])
    error_message = format(" alltrue ")
  }
}
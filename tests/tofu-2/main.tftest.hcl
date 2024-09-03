run "http" {
  # Load the test helper instead of the main module:
  module {
    source = "../../module/http/test-harness"
  }

  # Check if the webserver returned an HTTP 200 status code:
  assert {
    condition     = file(local_file.test.filename) == "Hello world!"
    error_message = "Incorrect content in ${local_file.test.filename}."
  }
}
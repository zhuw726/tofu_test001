package tests

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraform(t *testing.T) {
	terraformOpt := &terraform.Options{
		TerraformDir:    "vpc",
		TerraformBinary: "terragrunt",
	}
	terraform.InitAndApply(t, terraformOpt)

}

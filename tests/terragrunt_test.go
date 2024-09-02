package tests

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerragrunt(t *testing.T) {
	terraformOpt := &terraform.Options{
		TerraformDir:    "vpc",
		TerraformBinary: "terragrunt",
		// TerraformBinary: "tofu",
	}
	terraform.InitAndPlan(t, terraformOpt)
}

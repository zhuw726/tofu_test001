package tests

import (
	"context"
	"fmt"
	"log"
	"testing"

	"github.com/hashicorp/terraform-exec/tfexec"
)

func TestTofu(t *testing.T) {
	terraformBinary := "/opt/homebrew/bin/terraform" // Update this path to wherever OpenTofu is installed
	workingDir := "../module/vpc"                    // Update this path

	// Create a new OpenTofu instance
	tf, err := tfexec.NewTerraform(workingDir, terraformBinary)
	if err != nil {
		log.Fatalf("Error creating OpenTofu instance: %v", err)
	}

	// Initialize OpenTofu
	if err := tf.Init(context.Background()); err != nil {
		log.Fatalf("Error running opentofu init: %v", err)
	}

	// Run the OpenTofu plan and capture the output
	planOutput, err := tf.Plan(context.Background())
	if err != nil {
		log.Fatalf("Error running opentofu plan: %v", err)
	}

	// Print the plan output to the console
	fmt.Println("Plan output:")
	fmt.Println(planOutput)

	// Apply changes if there are any planned
	if planOutput {
		fmt.Println("Applying changes...")
		if err := tf.Apply(context.Background()); err != nil {
			log.Fatalf("Error running opentofu apply: %v", err)
		}
		fmt.Println("Apply successful")
	} else {
		fmt.Println("No changes to apply.")
	}
}

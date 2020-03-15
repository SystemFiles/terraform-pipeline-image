#!/bin/bash
# By: Benjamin Sykes
# Purpose: To authenticate with azure provider and run terraform builds in pipeline
set -e

echo "Setting environment variables for Terraform"
export ARM_SUBSCRIPTION_ID="$AZ_SUBSCRIPTION_ID"
export ARM_CLIENT_ID="$AZ_APP_ID"
export ARM_CLIENT_SECRET="$AZ_PASS"
export ARM_TENANT_ID="$AZ_TENANT"
echo "Done!"

# Login to azure using Service principle (Terraform AD Service Principal in use)
echo "Verifying access to azure AD..."
az account show
echo "Done."

# Initialize and validate Terraform (*.tf)
echo "Initializing terraform and validating code for syntax errors..."
terraform init
terraform validate

echo "Done."
# Run command
echo "Running Command."
exec "$@"
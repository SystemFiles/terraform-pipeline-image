#!/bin/bash
# By: Benjamin Sykes
# Purpose: To authenticate with azure provider and run terraform builds in pipeline
set -e

echo "Setting environment variables for Terraform"
export ARM_SUBSCRIPTION_ID="3a2efedf-fc87-4c5e-b3f8-a089ad33a2e8"
export ARM_CLIENT_ID="$AZ_APP_ID"
export ARM_CLIENT_SECRET="$AZ_PASS"
export ARM_TENANT_ID="$AZ_TENANT"

# Not needed for public, required for usgovernment, german, china
export ARM_ENVIRONMENT=public

# Login to azure using Service principle (Terraform AD Service Principal in use)
echo "Logging into azure through Terraform AD SP..."
# az login --service-principal -u $AZ_APP_ID -p $AZ_PASS --tenant $AZ_TENANT
# az account set -s student-dev
# az account show
echo "Done."
# Initialize and validate Terraform (*.tf)
echo "Initializing terraform and validating code for syntax errors..."
terraform init
terraform validate

echo "Done."
# Run command
echo "Running Command."
exec "$@"
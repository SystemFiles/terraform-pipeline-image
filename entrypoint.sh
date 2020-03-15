#!/bin/bash
# By: Benjamin Sykes
# Purpose: To authenticate with azure provider and run terraform builds in pipeline
set -e

echo "Setting environment variables for Terraform"
export ARM_SUBSCRIPTION_ID="3a2efedf-fc87-4c5e-b3f8-a089ad33a2e8"
export ARM_CLIENT_ID="89e8ca16-1090-49e0-a4c9-d8927b2835aa"
export ARM_CLIENT_SECRET="2e10ee4d-3034-44d5-9a88-2e8df2a9d807"
export ARM_TENANT_ID="0c4c6c9a-7ce2-4aa8-ab35-7a74ad4c80c3"

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
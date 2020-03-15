#!/bin/bash
# By: Benjamin Sykes
# Purpose: To authenticate with azure provider and run terraform builds in pipeline
set -e

# Login to azure using Service principle (Terraform AD Service Principal in use)
echo "Logging into azure through Terraform AD SP..."
# az login --service-principal -u http://Terraform -p 8ef52391-bdd6-4b34-8ea6-1b11a8ce7da7 --tenant 0c4c6c9a-7ce2-4aa8-ab35-7a74ad4c80c3
az login --service-principal --tenant $AZ_TENANT -u $AZ_APP_ID -p $AZ_PASS
echo "Done."
# Initialize and validate Terraform (*.tf)
echo "Initializing terraform and validating code for syntax errors..."
terraform init
terraform validate

echo "Done."
# Run command
echo "Running Command."
exec "$@"
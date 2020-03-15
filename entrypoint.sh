#!/bin/bash
# By: Benjamin Sykes
# Purpose: To authenticate with azure provider and run terraform builds in pipeline
set -e

# Login to azure using Service principle (Terraform AD Service Principal in use)
echo "Logging into azure through Terraform AD SP..."
# az login --service-principal -u $AZ_APP_ID -p $AZ_PASS --tenant $AZ_TENANT
az login
echo "Done."
# Initialize and validate Terraform (*.tf)
echo "Initializing terraform and validating code for syntax errors..."
terraform init
terraform validate

echo "Done."
# Run command
echo "Running Command."
exec "$@"
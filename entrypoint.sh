#!/bin/bash
set -e

# Login to azure using Service principle (Terraform AD Service Principal in use)
echo "Logging into azure through Terraform AD SP"
echo $AZ_PASS
echo $AZ_TENANT
# az login --service-principal -u http://Terraform -p 8ef52391-bdd6-4b34-8ea6-1b11a8ce7da7 --tenant 0c4c6c9a-7ce2-4aa8-ab35-7a74ad4c80c3
az login --service-principal --tenant $AZ_TENANT -u http://Terraform -p $AZ_PASS

# Initialize and validate Terraform (*.tf)
terraform init
terraform validate

# Run command
exec "$@"
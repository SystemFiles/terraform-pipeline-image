#!/bin/bash
set -e

# Login to azure using Service principle (Terraform AD Service Principal in use)
echo "Logging into azure through Terraform AD SP"
az login --service-principal -u http://Terraform -p $pass --tenant $tenant

# Initialize and validate Terraform (*.tf)
terraform init
terraform validate

# Run command
exec "$@"
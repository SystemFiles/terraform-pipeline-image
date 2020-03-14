#!/bin/sh
set -e

az login --service-principal -u http://Terraform -p $pass --tenant $tenant

echo "RUNNING TERRAFORM INIT"
terraform init | echo
exec "$@"
#!/bin/sh
set -e

exec "az login --service-principal -u http://Terraform -p $pass --tenant $tenant"
exec "terraform init"

exec "$@"
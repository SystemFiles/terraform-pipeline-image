#!/bin/sh
set -e

az login --service-principal -u http://Terraform -p $pass --tenant $tenant

exec "$@"
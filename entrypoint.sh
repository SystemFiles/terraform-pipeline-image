#!/bin/sh

az login --service-principal -u http://Terraform -p $pass --tenant $tenant
terraform init
terraform plan -o planfile
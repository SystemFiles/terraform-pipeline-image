FROM microsoft/azure-cli:latest as az

ENV pass=8ef52391-bdd6-4b34-8ea6-1b11a8ce7da7
ENV tenant=0c4c6c9a-7ce2-4aa8-ab35-7a74ad4c80c3

# Login to azure
RUN apk add --update --no-cache git bash openssl
RUN az login --service-principal -u http://Terraform -p $pass --tenant $tenant
WORKDIR /usr/local/bin

# Install git and terraform
RUN wget https://releases.hashicorp.com/terraform/$tf_version/terraform_$tf_version_linux_amd64.zip \
    unzip terraform_$tf_version_linux_amd64.zip \
    rm terraform_$tf_version_linux_amd64.zip
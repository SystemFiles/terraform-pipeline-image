FROM microsoft/azure-cli:latest as az

# Login to azure
RUN az login --service-principal -u http://Terraform -p $AZ_PASS --tenant $AZ_TENANT
WORKDIR /usr/local/bin

# Install git and terraform
RUN apk add --update --no-cache git bash openssl
RUN wget https://releases.hashicorp.com/terraform/$tf_version/terraform_$tf_version_linux_amd64.zip \
    unzip terraform_$tf_version_linux_amd64.zip \
    rm terraform_$tf_version_linux_amd64.zip
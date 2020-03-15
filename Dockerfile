# This image is for setting up and running the terraform environment

FROM microsoft/azure-cli:latest as az
WORKDIR /terraform

# Set appropriate environment varaibles
ENV AZ_PASS=$pass
ENV AZ_TENANT=$tenant
COPY . .

# Login to azure
RUN apk add --update --no-cache git bash openssl

# Install git and terraform
RUN wget https://releases.hashicorp.com/terraform/0.12.19/terraform_0.12.19_linux_amd64.zip && \
    unzip terraform_0.12.19_linux_amd64.zip && \
    rm terraform_0.12.19_linux_amd64.zip && \
    mv terraform /usr/local/bin

# Note to self: This is run INSITE WORKDIR
RUN chmod 755 ./entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]
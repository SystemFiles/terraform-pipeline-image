ARG pass
ARG tenant
ARG tf_version

FROM microsoft/azure-cli:latest as az

# Login to azure
RUN apk add --update --no-cache git bash openssl

WORKDIR /usr/local/bin

# Install git and terraform
RUN wget https://releases.hashicorp.com/terraform/0.12.19/terraform_0.12.19_linux_amd64.zip && \
    unzip terraform_0.12.19_linux_amd64.zip && \
    rm terraform_0.12.19_linux_amd64.zip

WORKDIR /terraform
COPY ./entrypoint.sh .
RUN chmod 755 entrypoint.sh

CMD [ "./terraform/entrypoint.sh" ]
ARG pass
ARG tenant
ARG tf_version

FROM microsoft/azure-cli:latest as az

# Login to azure
RUN apk add --update --no-cache git bash openssl

WORKDIR /usr/local/bin

# Install git and terraform
RUN wget https://releases.hashicorp.com/terraform/$tf_version/terraform_$tf_version_linux_amd64.zip && \
    unzip terraform_$tf_version_linux_amd64.zip && \
    rm terraform_$tf_version_linux_amd64.zip

WORKDIR /terraform
COPY ./entrypoint.sh .
RUN chmod 755 entrypoint.sh

CMD [ "./terraform/entrypoint.sh" ]
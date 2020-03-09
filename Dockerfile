FROM sykeben/pipeline-az-terraform:1.0
RUN az login -u "$AZUSER" -p "$AZPASS"

WORKDIR /infra

COPY . .

RUN terraform init

ENTRYPOINT [ "terraform" ]
FROM sykeben/pipeline-az-terraform:1.0
RUN az login --username ${AZUSER} --password ${AZPASS}

COPY . .

ENTRYPOINT [ "terraform" ]
CMD [ "plan" ]
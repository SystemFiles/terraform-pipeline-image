FROM sykeben/pipeline-az-terraform:1.0
RUN az login -u $AZUSER -p $AZPASS

COPY . .

ENTRYPOINT [ "terraform" ]
CMD [ "plan" ]
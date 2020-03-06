FROM sykeben/pipeline-az-terraform:1.0
RUN echo "USERNAME: "
RUN echo "$AZUSER"
RUN az login -u "$AZUSER" -p "$AZPASS"

COPY . .

ENTRYPOINT [ "terraform" ]
CMD [ "plan" ]
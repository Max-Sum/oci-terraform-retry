FROM gzmaxsum/oci-terraform

USER root

ADD app.sh /

RUN apt-get update && apt-get install -y curl \
 && rm -rf /var/lib/apt/lists/* \
 && chmod +x /app.sh

USER nonroot

ENV INTERVAL=1
ENV TELEGRAM_MESSAGE="Terraform succeeded."
ENV TELEGRAM_BOT_TOKEN=""
ENV TELEGRAM_CHAT_ID=""

CMD [ "/app.sh" ]
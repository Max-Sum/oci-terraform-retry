#!/bin/bash

terraform init
retVal=$?
if [ $retVal -ne 0 ]; then
  echo "Terraform Initialize error. Check your configurations."
  exit $retVal
fi

trap 'exit' SIGINT SIGTERM
while true
do
  echo 'yes' | terraform apply -lock=false
  retVal=$?
  if [ $retVal -eq 0 ]; then
    break
  fi
  sleep ${INTERVAL}s
done

echo "Done."

if [ "x$TELEGRAM_BOT_TOKEN" != "x" ]; then
  curl --location --request POST \
    'https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage' \
    --form 'text=${TELEGRAM_MESSAGE}' \
    --form 'chat_id=${TELEGRAM_CHAT_ID}' \
    --form 'parse_mode=markdown'
fi
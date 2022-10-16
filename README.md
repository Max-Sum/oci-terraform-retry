### Retry terraform until applied successfully

### Prerequision

1. Create an api key from Oracle Cloud
2. Copy the configuration file and private key to your computer
3. Get a terraform configuration
4. (Optional) Create a telegram bot for notification

### Usage

Mount api key, api config and terraform config to the container.

```
docker run gzmaxsum/oci-terraform-retry \
  -v main.tf:/app/main.tf:ro \
  -v ociconfig:/app/.oci/config:ro \ 
  -v priv.key:/app/.oci/priv.key:ro \
  -n oci-terraform-retry
```

Optional environments:

| Environment        | Description                                                                                                                                                                            | Default Value        |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------- |
| INTERVAL           | Seconds between trials.                                                                                                                                                                | 1                    |
| TELEGRAM_MESSAGE   | The message send to you after finish. Say something to congrat yourself!                                                                                                               | Terraform succeeded. |
| TELEGRAM_BOT_TOKEN | Telegram bot token. Created from @botfather.<br />Fill this to notify you the finish of terraform.                                                                                     | (empty)              |
| TELEGRAM_CHAT_ID   | Chat ID to send message to.<br />You can get this by sending a message to your bot and check<br />` https://api.telegram.org/botXXXXXXXXX:YYYYYYY-YYYYYYYYYYYYYYYYY_YY/getUpdates.` | (empty)              |

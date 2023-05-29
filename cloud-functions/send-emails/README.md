# Sending Emails using Cloud Functions and SendGrid

## SendGrid API Key

Retrieve from https://app.sendgrid.com/settings/api_keys 

## Deployment

```shell
rm package-lock.json

gcloud functions deploy \
    sendGrid --entry-point sendGrid \
    --runtime nodejs12 --trigger-http \
    --allow-unauthenticated
```

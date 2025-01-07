# Send Email using SendGrid API

## Sample trigger

```bash
curl -m 70 -X POST https://us-central1-polar-processor-382521.cloudfunctions.net/sendgrid-http-function \
-H "Authorization: bearer $(gcloud auth print-identity-token)" \
-H "Content-Type: application/json" \
-d '{
  "to": "lamnguyen110500@gmail.com",
  "from": "coach.lary.ng@proton.me",
  "subject": "Test Email",
  "content": "<h1>Hello from SendGrid!</h1><p>This is a test email sent from a Cloud Function.</p>"
}'
```

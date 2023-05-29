# Hello World

```shell
gcloud functions deploy hello-http-function --entry-point helloHttp --runtime nodejs12 --trigger-http -q
```

## Command to test

```shell
curl -X GET "https://us-central1-polar-processor-382521.cloudfunctions.net/hello-http-function" -H \
    "Authorization: Bearer \
    $(gcloud auth print-identity-token)" --header "Content-Type: application/json"
```

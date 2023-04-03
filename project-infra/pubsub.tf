// Topic
resource "google_pubsub_topic" "topic_no_schema" {
  project                    = local.project-id
  name                       = "topic-no-schema"
  message_retention_duration = "86600s"
}
// End Topic

// Subscription
resource "google_pubsub_subscription" "topic_no_schema_subscription" {
  project = local.project-id
  name    = "${google_pubsub_topic.topic_no_schema.name}-sub"
  topic   = google_pubsub_topic.topic_no_schema.name

  ack_deadline_seconds       = 20
  message_retention_duration = "1200s"
  expiration_policy {
    ttl = "300000.5s"
  }
  retry_policy {
    minimum_backoff = "10s"
  }

  enable_message_ordering = false
}
// End subscription

// Subscription IAM
resource "google_pubsub_subscription_iam_binding" "topic_no_schema_dataflow_subscription_iam_binding" {
  members = [
    "serviceAccount:${google_service_account.dataflow_sa.email}"
  ]
  role         = "roles/editor"
  subscription = google_pubsub_subscription.topic_no_schema_subscription.name
}
// End subscription IAM

// Publisher IAM

// End Publisher IAM
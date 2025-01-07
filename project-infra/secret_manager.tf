resource "google_secret_manager_secret" "my-secret" {
  provider = google-beta

  secret_id = "sendgrid-api-key"

  replication {
    
  }

  depends_on = [google_project_service.secretmanager]
}

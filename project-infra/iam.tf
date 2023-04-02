resource "google_service_account" "github_action_sa" {
  account_id  = "github-action-sa"
  description = "Service Account to automate Terraform via Github Action"
}

resource "google_storage_bucket_iam_member" "github_action_sa_tfstate_binding" {
  bucket = google_storage_bucket.default.name
  member = "serviceAccount:${google_service_account.github_action_sa.email}"
  role   = "roles/storage.admin"
}

resource "google_project_iam_member" "github_action_sa_iam_binding" {
  member  = "serviceAccount:${google_service_account.github_action_sa.email}"
  project = local.project-id
  role    = "iam.serviceAccounts.get"
}
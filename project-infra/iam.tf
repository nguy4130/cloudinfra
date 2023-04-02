resource "google_service_account" "github_action_sa" {
  account_id  = "github-action-sa"
  description = "Service Account to automate Terraform via Github Action"
}

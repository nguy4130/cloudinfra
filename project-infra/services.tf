resource "google_project_service" "cloud-functions" {
  project = local.project-id
  service = "cloudfunctions.googleapis.com"
}

resource "google_project_service" "cloud-build" {
  project = local.project-id
  service = "cloudbuild.googleapis.com"
}

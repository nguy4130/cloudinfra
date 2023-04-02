provider "google" {
  project = "polar-processor-382521"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_storage_bucket" "default" {
  name          = "john-nguyen-gcp-bucket-tfstate"
  force_destroy = false
  location      = "US"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}
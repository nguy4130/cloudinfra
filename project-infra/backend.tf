terraform {
  backend "gcs" {
    bucket  = "john-nguyen-gcp-bucket-tfstate"
    prefix  = "terraform/state"
  }
}
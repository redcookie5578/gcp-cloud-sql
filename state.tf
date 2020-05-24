terraform {
  backend "gcs" {
    credentials = "accounts.json"
    bucket  = "tf-state-gcp"
    prefix  = "terraform/state"
  }
}
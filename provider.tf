provider "google" {
  credentials = file("accounts.json") #path to your google credentials file
  project     = "" #Insert your project ID
  region      = "" #gcp Region
}

provider "google-beta" {
  version = "~> 2.13"
}

provider "random" {
  version = "~> 2.2"
}
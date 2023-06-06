## Google Provider 
provider "google" {
  project = var.project_id
  region  = var.region
}

# Terraform Backend 
terraform {
  backend "gcs" {
    bucket = "terraform-checkov-demo"
    prefix = "terraform/state"
  }
}

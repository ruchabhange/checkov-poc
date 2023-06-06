# Ressource 1: cloud run service running the docker image
# Write the path to the docker image hosted in the google container registry
# To set up this resource with Terraform, the service account key used 
# must have the appropriate permissions.
resource "google_cloud_run_service" "default" {
  name     = "demo"
  location =  var.region
  template {
    spec {
      containers {
        image = "gcr.io/omni-new/demo:latest"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}


# Create public access
#data "google_iam_policy" "noauth" {
#  binding {
#    role = "roles/viewer"
#    members = [
#      "allUsers",
#    ]
#  }
#}
## Enable public access on Cloud Run service
#resource "google_cloud_run_service_iam_policy" "noauth" {
#  location    = google_cloud_run_service.default.location
#  project     = google_cloud_run_service.default.project
#  service     = google_cloud_run_service.default.name
#  policy_data = data.google_iam_policy.noauth.policy_data
#}
#
## Display the service URL
#output "service_url" {
#  value = google_cloud_run_service.default.status[0].url
#}

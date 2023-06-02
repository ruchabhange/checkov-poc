### Adding Artifact_registry for docker images through Terraform ###

# Adding Artifact_registry for list of services defined, for now adding it for source-service
resource "google_artifact_registry_repository" "artifact_registry" {
  count         = length(var.artifact_registry)
  repository_id = element(var.artifact_registry, count.index)
  location      = var.region
  description   = "Docker registry for services"
  format        = "DOCKER"
}

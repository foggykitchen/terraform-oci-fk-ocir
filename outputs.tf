output "repository_id" {
  description = "OCI Artifacts container repository OCID."
  value       = oci_artifacts_container_repository.this.id
}

output "repository_name" {
  description = "Repository name or path inside the OCI registry namespace."
  value       = oci_artifacts_container_repository.this.display_name
}

output "namespace" {
  description = "OCI registry namespace used for the repository path."
  value       = local.namespace
}

output "registry" {
  description = "Resolved OCIR registry hostname, for example fra.ocir.io."
  value       = local.registry
}

output "image_prefix" {
  description = "Canonical OCIR image prefix without a tag, for example fra.ocir.io/namespace/repository."
  value       = local.image_prefix
}

output "latest_image" {
  description = "Convenience output for the latest image tag."
  value       = format("%s:latest", local.image_prefix)
}

output "repository" {
  description = "Structured repository summary."
  value = {
    id           = oci_artifacts_container_repository.this.id
    name         = oci_artifacts_container_repository.this.display_name
    namespace    = local.namespace
    registry     = local.registry
    image_prefix = local.image_prefix
    latest_image = format("%s:latest", local.image_prefix)
    is_public    = oci_artifacts_container_repository.this.is_public
    is_immutable = oci_artifacts_container_repository.this.is_immutable
  }
}

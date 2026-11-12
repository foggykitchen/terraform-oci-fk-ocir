# Synthetic fixtures only. Every run is plan-only; no tenancy credentials are used.
mock_provider "oci" {
  mock_data "oci_identity_regions" {
    defaults = { "id" = "MOCK_OCID_REGIONS", "regions" = [{ "key" = "FRA", "name" = "eu-frankfurt-1" }, { "key" = "AMS", "name" = "eu-amsterdam-1" }] }
  }
  mock_data "oci_objectstorage_namespace" {
    defaults = { "id" = "MOCK_OCID_NAMESPACE", "namespace" = "mocknamespace" }
  }
  mock_resource "oci_artifacts_container_repository" {
    defaults = { "billable_size_in_gbs" = "mock-value", "created_by" = "mock-value", "id" = "MOCK_OCID_REPOSITORY", "image_count" = 1, "layer_count" = 1, "layers_size_in_bytes" = "mock-value", "namespace" = "mocknamespace", "state" = "AVAILABLE", "system_tags" = {}, "time_created" = "mock-value", "time_last_pushed" = "mock-value" }
  }
}
variables {
  compartment_ocid = "MOCK_OCID_COMPARTMENT"
  repository_name  = "compatibility"
  region           = "eu-frankfurt-1"
}

run "oci9_plan" {
  command = plan
}

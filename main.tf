data "oci_identity_regions" "this" {
  count = var.registry == null ? 1 : 0

  filter {
    name   = "name"
    values = [var.region]
  }
}

data "oci_objectstorage_namespace" "this" {
  count = var.namespace == null ? 1 : 0

  compartment_id = coalesce(var.namespace_compartment_ocid, var.compartment_ocid)
}

locals {
  registry = coalesce(
    var.registry,
    format("%s.ocir.io", lower(data.oci_identity_regions.this[0].regions[0].key))
  )

  namespace = coalesce(
    var.namespace,
    data.oci_objectstorage_namespace.this[0].namespace
  )

  image_prefix = format("%s/%s/%s", local.registry, local.namespace, var.repository_name)
}

resource "oci_artifacts_container_repository" "this" {
  compartment_id = var.compartment_ocid
  display_name   = var.repository_name
  is_public      = var.is_public
  is_immutable   = var.is_immutable
  defined_tags   = var.defined_tags
  freeform_tags  = var.freeform_tags

  lifecycle {
    precondition {
      condition     = var.registry != null || var.region != null
      error_message = "region must be set when registry is not provided."
    }
  }
}

module "ocir" {
  source = "../.."

  compartment_ocid = var.compartment_ocid
  repository_name  = "fknginx/fknginx"
  region           = var.region
}

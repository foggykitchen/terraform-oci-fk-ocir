module "ocir" {
  source = "../.."

  compartment_ocid = var.compartment_ocid
  repository_name  = "demo/nginx"
  region           = var.region
  is_public        = true
  is_immutable     = true
}

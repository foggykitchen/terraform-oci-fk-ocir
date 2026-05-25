variable "compartment_ocid" {
  description = "Compartment OCID where the OCIR repository will be created."
  type        = string
}

variable "repository_name" {
  description = "Repository path inside the OCI registry namespace, for example fknginx/fknginx."
  type        = string
}

variable "region" {
  description = "OCI region name used to resolve the OCIR registry hostname when registry is not provided."
  type        = string
  default     = null
}

variable "registry" {
  description = "Optional explicit OCIR registry hostname, for example fra.ocir.io. When null, it is resolved from region."
  type        = string
  default     = null
}

variable "namespace" {
  description = "Optional explicit OCI registry namespace. When null, the module resolves it through the OCI Object Storage namespace data source."
  type        = string
  default     = null
}

variable "namespace_compartment_ocid" {
  description = "Optional compartment or tenancy OCID used for namespace lookup when namespace is null. Defaults to compartment_ocid."
  type        = string
  default     = null
}

variable "is_public" {
  description = "Whether the OCIR repository is public."
  type        = bool
  default     = false
}

variable "is_immutable" {
  description = "Whether the OCIR repository is immutable."
  type        = bool
  default     = false
}

variable "defined_tags" {
  description = "Defined tags applied to the OCIR repository."
  type        = map(string)
  default     = {}
}

variable "freeform_tags" {
  description = "Freeform tags applied to the OCIR repository."
  type        = map(string)
  default     = {}
}

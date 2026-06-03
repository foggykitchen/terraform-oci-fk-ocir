# terraform-oci-fk-ocir

This repository contains a reusable **Terraform/OpenTofu module** and progressive examples for deploying **Oracle Cloud Infrastructure Registry (OCIR)** repositories used by container-based workloads.

It is part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/)** and is designed to work cleanly with reusable infrastructure modules such as **`terraform-oci-fk-oke`**, **`terraform-oci-fk-compute`**, and **`terraform-oci-fk-vcn`**.

Support expectations are documented in [SUPPORT.md](SUPPORT.md).

---

## Purpose

The goal of this module is to provide a **clean, composable, and educational reference implementation** for OCI container registry usage:

- Focused on OCI-native container repository primitives
- Suitable for Kubernetes, compute, and CI or CD image distribution patterns
- Designed for hands-on learning, module composition, and multicloud comparisons

This is **not** a full software delivery platform. It is a **learning-first, architecture-aware module**.

---

## What the module does

The module creates:

- OCI Artifacts container repository
- Optional OCIR namespace discovery
- Optional OCIR registry hostname discovery from the OCI region
- Ready-to-use canonical image prefix outputs

The module intentionally does **not** create:

- Docker images
- Docker login sessions
- CI or CD pipelines
- Kubernetes image pull secrets
- IAM policies for build runners or cluster pull identities

Each of those concerns belongs in its own dedicated module or workflow layer.

---

## Repository Structure

```bash
terraform-oci-fk-ocir/
├── examples/
│   ├── 01_private_repository/
│   ├── 02_public_immutable_repository/
│   └── README.md
├── main.tf
├── inputs.tf
├── outputs.tf
├── versions.tf
├── LICENSE
└── README.md
```

All examples are runnable and demonstrate **incremental OCIR repository patterns**, starting from a private repository and progressing to a public or immutable variant.

---

## Example Usage

### Private repository with automatic namespace and registry discovery

```hcl
module "ocir" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-ocir.git?ref=v0.1.0"

  compartment_ocid = var.compartment_ocid
  repository_name  = "fknginx/fknginx"
  region           = var.region
}
```

### Public immutable repository

```hcl
module "ocir" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-ocir.git?ref=v0.1.0"

  compartment_ocid = var.compartment_ocid
  repository_name  = "demo/nginx"
  region           = var.region
  is_public        = true
  is_immutable     = true
}
```

---

## Module Inputs

### Core inputs

| Variable | Type | Required | Description |
|--------|------|----------|-------------|
| `compartment_ocid` | `string` | yes | OCI compartment OCID where the repository is created |
| `repository_name` | `string` | yes | Repository path inside the OCI registry namespace |
| `region` | `string` | no | OCI region name used to resolve the OCIR hostname when `registry` is null |
| `registry` | `string` | no | Explicit OCIR registry hostname such as `fra.ocir.io` |
| `namespace` | `string` | no | Explicit OCI registry namespace |
| `namespace_compartment_ocid` | `string` | no | Compartment or tenancy OCID used for namespace discovery when `namespace` is null |
| `is_public` | `bool` | no | Whether the repository is public |
| `is_immutable` | `bool` | no | Whether the repository is immutable |
| `defined_tags` | `map(string)` | no | Defined tags |
| `freeform_tags` | `map(string)` | no | Freeform tags |

### Discovery behavior

If `registry` is not supplied, the module resolves it from `region` and returns values such as:

- `fra.ocir.io`
- `phx.ocir.io`
- `iad.ocir.io`

If `namespace` is not supplied, the module resolves it from the OCI Object Storage namespace data source.

This makes the module convenient for lesson and example code that wants a ready-to-use `image_prefix` without repeating local discovery logic.

---

## Module Outputs

| Output | Description |
|--------|-------------|
| `repository_id` | OCI Artifacts container repository OCID |
| `repository_name` | Repository name or path inside the OCI registry namespace |
| `namespace` | OCI registry namespace |
| `registry` | Resolved OCIR registry hostname |
| `image_prefix` | Canonical image prefix without a tag |
| `latest_image` | Convenience output for `${image_prefix}:latest` |
| `repository` | Structured summary object with key repository fields |

---

## Typical Integration Pattern

This module is intentionally narrow.

A typical pattern looks like this:

1. Create the repository with `terraform-oci-fk-ocir`
2. Build and push images from a CI job, Cloud Shell, or local Docker workflow
3. Use `image_prefix` or `latest_image` in:
   - `terraform-oci-fk-oke` lessons
   - Kubernetes manifests
   - compute bootstrap logic
   - deployment pipelines

This keeps repository management separate from image build and application delivery workflows.

---

## Examples

Runnable examples are available in [examples](examples/README.md).

They show:

- private repository creation
- public immutable repository creation
- local module usage with OCI provider configuration

---

## Contributing

This project is open source. Contributions are welcome through pull requests.

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [LICENSE](LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.

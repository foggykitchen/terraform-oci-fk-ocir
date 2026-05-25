# OCI Registry with Terraform/OpenTofu - Training Examples

This directory contains runnable examples for the **terraform-oci-fk-ocir** module.
The examples focus on practical OCI registry repository patterns, from a default private repository to a public immutable repository.

These examples are part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/)** and are used across OCI and multicloud courses covering container images, Kubernetes, delivery pipelines, and architecture fundamentals.

---

## Published Examples

| Example | Title | Key Topics |
|:-------:|:------|:-----------|
| 01 | **Private Repository** | OCIR repository creation, namespace discovery, registry hostname discovery |
| 02 | **Public Immutable Repository** | public repository mode, immutable images, explicit repository policy choices |

---

## How to Use

The example directory contains:
- Terraform/OpenTofu configuration (`.tf`)
- A focused `README.md` explaining the goal of the example
- A minimal, runnable architecture

To run the private repository example:

```bash
cd examples/01_private_repository
tofu init
tofu plan
tofu apply
```

To run the public immutable repository example:

```bash
cd examples/02_public_immutable_repository
tofu init
tofu plan
tofu apply
```

---

## Design Principles

- One example = one architectural goal
- No unused or placeholder resources
- Clear separation of concerns between repository provisioning and image delivery workflows
- Examples designed to integrate with other modules such as OKE and Compute

---

## Related Resources

- [FoggyKitchen OCI Registry Module (terraform-oci-fk-ocir)](../)
- [FoggyKitchen OCI OKE Module (terraform-oci-fk-oke)](https://github.com/foggykitchen/terraform-oci-fk-oke)
- [FoggyKitchen OCI Compute Module (terraform-oci-fk-compute)](https://github.com/foggykitchen/terraform-oci-fk-compute)
- [FoggyKitchen Azure Container Registry Module (terraform-az-fk-acr)](https://github.com/mlinxfeld/terraform-az-fk-acr)

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [LICENSE](../LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.

# Example 02: Public Immutable OCIR Repository

In this second registry example, we create a **public and immutable Oracle Cloud Infrastructure Registry (OCIR) repository**
using **Terraform/OpenTofu**.
This demonstrates the policy-oriented repository path where image visibility and mutability are explicit architectural decisions.

This example focuses on **repository behavior choices**, not on image build or delivery tooling.

---

## Architecture Overview

This deployment creates:

- one **public OCI Artifacts container repository**
- one **immutable image policy**
- one resolved **OCIR namespace**
- one resolved **OCIR registry hostname**
- one ready-to-use **image prefix** output

This is useful when you want repository behavior to be constrained up front,
for example in demo, release, or content distribution scenarios.

---

## Deployment Steps

Initialize and apply the Terraform/OpenTofu configuration:

```bash
tofu init
tofu plan
tofu apply
```

If you prefer Terraform:

```bash
terraform init
terraform plan
terraform apply
```

After a successful deployment, Terraform will output the same canonical repository details as Example 01,
but with a repository configured as public and immutable.

---

## Runtime Notes

With `is_public = true`, images can be pulled without the same private-registry authentication path.

With `is_immutable = true`, pushed tags cannot be overwritten in the same way as a mutable repository.

This makes the example useful for understanding how repository policy choices affect downstream delivery design.

---

## Cleanup

To remove all resources created by this example:

```bash
tofu destroy
```

Or with Terraform:

```bash
terraform destroy
```

---

## Summary

This example demonstrates:

- how to create a **public OCIR repository**
- how to enable **immutable image behavior**
- how to keep registry provisioning separate from container build and deployment workflows

---

## Learn More

Visit [FoggyKitchen.com](https://foggykitchen.com/) for OCI, multicloud, and Terraform/OpenTofu learning resources.

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [LICENSE](../../LICENSE) for more details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.

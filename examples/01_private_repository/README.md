# Example 01: Private OCIR Repository

In this first registry example, we create a **private Oracle Cloud Infrastructure Registry (OCIR) repository**
using **Terraform/OpenTofu**.
The module resolves the **registry hostname** from the OCI region and discovers the **namespace**
through OCI data sources, so the example stays compact and reusable.

This example is intentionally simple and focuses on the **default private repository path**
without public exposure or immutable image policy.

---

## Architecture Overview

This deployment creates:

- one **private OCI Artifacts container repository**
- one resolved **OCIR namespace**
- one resolved **OCIR registry hostname**
- one ready-to-use **image prefix** output for downstream workflows

This is the most direct way to understand how the module behaves
when you only want a repository and the canonical image path.

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

After a successful deployment, Terraform will output:

- the repository OCID
- the repository name
- the OCI namespace
- the resolved OCIR hostname
- the canonical image prefix

---

## Runtime Notes

The resulting `image_prefix` can be used directly in a local or CI build workflow, for example:

```bash
docker tag fknginx:latest <image_prefix>:latest
docker push <image_prefix>:latest
```

This keeps repository provisioning separate from the image build and push workflow.

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

- how to create a **private OCIR repository** using Terraform/OpenTofu
- how to resolve **namespace** and **registry** automatically
- how to expose a clean **image prefix** for downstream delivery workflows

---

## Learn More

Visit [FoggyKitchen.com](https://foggykitchen.com/) for OCI, multicloud, and Terraform/OpenTofu learning resources.

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [LICENSE](../../LICENSE) for more details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.

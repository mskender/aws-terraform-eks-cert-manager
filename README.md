# EKS Simple cert-manager module

WARNING: Still in progress, so bound to change often! Do not use this in production (yet)!

## Description

This is a simple module for creating a cookie-cutter cert-manager deployment for ingress-nginx and EKS

## Examples

```

```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=3.38.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.clusterissuer](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Version of the chart to deploy. 4.x requires K8S 1.19+, for older versions use version 3.40.0 | `string` | `"v1.6.1"` | no |
| <a name="input_cluster_issuer_key_name"></a> [cluster\_issuer\_key\_name](#input\_cluster\_issuer\_key\_name) | Name for default ACME cluster issuer private key. | `string` | `null` | no |
| <a name="input_cluster_issuer_name"></a> [cluster\_issuer\_name](#input\_cluster\_issuer\_name) | Name for default ACME cluster issuer. | `string` | `"le-prod"` | no |
| <a name="input_create_cluster_issuer"></a> [create\_cluster\_issuer](#input\_create\_cluster\_issuer) | Whether to create a default ACME cluster issuer. | `bool` | `true` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Whether to create namespace if it doesn't exist. | `bool` | `true` | no |
| <a name="input_ingress_class"></a> [ingress\_class](#input\_ingress\_class) | Ingress class for default ACME cluster issuer. | `string` | `"nginx"` | no |
| <a name="input_install_cert_manager"></a> [install\_cert\_manager](#input\_install\_cert\_manager) | Whether to install Jetstack's Cert Manager from helm chart. | `bool` | `false` | no |
| <a name="input_install_crds"></a> [install\_crds](#input\_install\_crds) | Whether to install Cert-Manager Custom Resource Definitions. Might be unavailable for oldr versions of cert-manager and/or K8S cluster. | `bool` | `true` | no |
| <a name="input_mail_address"></a> [mail\_address](#input\_mail\_address) | Mail address to register for default ACME cluster issuer. | `string` | `"admin@example.com"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | What namespace to create controller in. | `string` | `"cert-manager"` | no |
| <a name="input_prometheus_enabled"></a> [prometheus\_enabled](#input\_prometheus\_enabled) | Whether to enable Prometheus integration. | `bool` | `false` | no |
| <a name="input_replica_count"></a> [replica\_count](#input\_replica\_count) | How many replicas of cert-manager controller to run. | `number` | `1` | no |

## Outputs

No outputs.

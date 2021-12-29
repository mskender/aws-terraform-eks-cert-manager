locals {
    
    cluster_issuer_key_name = var.cluster_issuer_key_name == null ? "${var.cluster_issuer_name}-key1" : var.cluster_issuer_key_name
    clusterissuer_manifest = templatefile("${path.module}/templates/acme-clusterissuer.tpl" ,
    {
        acme_clusterissuer_name = var.cluster_issuer_name
        acme_clusterissuer_mailaddr = var.mail_address
        acme_clusterissuer_key = local.cluster_issuer_key_name
        acme_clusterissuer_ingress_class = var.ingress_class

    })
    chart_values = templatefile("${path.module}/templates/cert-manager-values.tpl",
    {
        install_crds = var.install_crds
        prometheus_enabled = var.prometheus_enabled
        replica_count = var.replica_count
    })

}


resource "helm_release" "cert_manager" {

count = var.install_cert_manager ? 1 : 0
name = "cert-manager"
repository = "https://charts.jetstack.io"
chart = "cert-manager"
version = var.chart_version
namespace = var.namespace
create_namespace = var.create_namespace

values = [ 
    local.chart_values
]

}


resource "kubectl_manifest" "clusterissuer" {
    count = (var.install_cert_manager && var.create_cluster_issuer) ? 1 : 0
    yaml_body = local.clusterissuer_manifest

    depends_on = [
      helm_release.cert_manager
    ]
} 
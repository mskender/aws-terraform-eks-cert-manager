variable install_cert_manager {
    default = false
    description = "Whether to install Jetstack's Cert Manager from helm chart."
}

variable chart_version {
    description = "Version of the chart to deploy. 4.x requires K8S 1.19+, for older versions use version 3.40.0"
    type = string
    default = "v1.6.1"
}

variable namespace {
    default = "cert-manager"
    description = "What namespace to create controller in."
    type = string
}

variable create_namespace {
    type = bool
    default = true
    description = "Whether to create namespace if it doesn't exist."
}

variable install_crds {
    type = bool
    default = true
    description = "Whether to install Cert-Manager Custom Resource Definitions. Might be unavailable for oldr versions of cert-manager and/or K8S cluster."
}

variable prometheus_enabled {
    type = bool
    default = false
    description = "Whether to enable Prometheus integration."
}

variable replica_count {
    type = number
    default = 1
    description = "How many replicas of cert-manager controller to run."
}

variable create_cluster_issuer {
    type = bool
    description = "Whether to create a default ACME cluster issuer."
    default = true
}
variable cluster_issuer_key_name {
    type = string
    description = "Name for default ACME cluster issuer private key."
    default = null
}

variable cluster_issuer_name {
    type = string
    description = "Name for default ACME cluster issuer."
    default = "le-prod"
}

variable ingress_class {
    type = string
    description = "Ingress class for default ACME cluster issuer."
    default = "nginx"
}

variable mail_address {
    type = string
    description = "Mail address to register for default ACME cluster issuer."
    default = "admin@example.com"
}
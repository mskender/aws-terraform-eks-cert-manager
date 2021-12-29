
installCRDs: ${install_crds}
replicaCount: ${replica_count}
prometheus:
    enabled: ${prometheus_enabled}
    servicemonitor:
        enabled: false
        prometheusInstance: default
        targetPort: 9402
        path: /metrics
        interval: 60s
        scrapeTimeout: 30s
        labels: {}
        honorLabels: false
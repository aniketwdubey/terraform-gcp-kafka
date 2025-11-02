resource "google_managed_kafka_cluster" "cluster" {
  cluster_id = var.cluster_id
  location   = var.region
  project    = var.project_id

  capacity_config {
    vcpu_count   = var.vcpu_count
    memory_bytes = var.memory_bytes
  }

  gcp_config {
    access_config {
      dynamic "network_configs" {
        for_each = var.access_config.network_configs
        content {
          subnet = network_configs.value.subnet
        }
      }
    }
  }

  rebalance_config {
    mode = "AUTO_REBALANCE_ON_SCALE_UP"
  }

  labels = var.labels
}

output "cluster_id" {
  description = "ID of the Kafka cluster"
  value       = google_managed_kafka_cluster.cluster.cluster_id
}

output "cluster_name" {
  description = "Full resource name of the cluster"
  value       = google_managed_kafka_cluster.cluster.name
}

output "bootstrap_servers" {
  description = "Bootstrap servers for Kafka connections"
  value       = google_managed_kafka_cluster.cluster.gcp_config[0].access_config[0].network_configs[0].subnet
  sensitive   = true
}

output "state" {
  description = "Current state of the cluster"
  value       = google_managed_kafka_cluster.cluster.state
}

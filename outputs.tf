output "cluster_ids" {
  description = "IDs of the created Kafka clusters"
  value       = { for k, v in module.kafka_clusters : k => v.cluster_id }
}

output "cluster_names" {
  description = "Full names of the Kafka clusters"
  value       = { for k, v in module.kafka_clusters : k => v.cluster_name }
}

output "bootstrap_servers" {
  description = "Bootstrap servers for connecting to the Kafka clusters"
  value       = { for k, v in module.kafka_clusters : k => v.bootstrap_servers }
  sensitive   = true
}

output "cluster_states" {
  description = "Current state of the Kafka clusters"
  value       = { for k, v in module.kafka_clusters : k => v.state }
}

output "topic_ids" {
  description = "IDs of created Kafka topics by cluster"
  value       = { for k, v in module.kafka_topics : k => v.topic_id }
}

output "topic_names" {
  description = "Full names of created Kafka topics by cluster"
  value       = { for k, v in module.kafka_topics : k => v.topic_name }
}

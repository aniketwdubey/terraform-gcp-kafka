resource "google_managed_kafka_topic" "topic" {
  topic_id   = var.topic_id
  cluster    = var.cluster_id
  location   = var.region
  partition_count  = var.partition_count
  replication_factor = var.replication_factor
  configs = var.configs
}

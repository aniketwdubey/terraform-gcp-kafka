output "topic_id" {
  description = "ID of the Kafka topic"
  value       = google_managed_kafka_topic.topic.topic_id
}

output "topic_name" {
  description = "Full resource name of the topic"
  value       = google_managed_kafka_topic.topic.name
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "cluster_id" {
  description = "Kafka cluster ID"
  type        = string
}

variable "topic_id" {
  description = "Kafka topic ID"
  type        = string
}

variable "partition_count" {
  description = "Number of partitions"
  type        = number
  default     = 3
}

variable "replication_factor" {
  description = "Replication factor"
  type        = number
  default     = 3
}

variable "configs" {
  description = "Topic configuration parameters"
  type        = map(string)
  default     = {}
}

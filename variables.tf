variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region for Kafka cluster"
  type        = string
  default     = "us-central1"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "kafka_clusters" {
  description = "Map of Kafka clusters to create"
  type = map(object({
    cluster_id    = string
    vcpu_count    = number
    memory_bytes  = string
    access_config = object({
      network_configs = list(object({
        subnet = string
      }))
    })
    kafka_topics = optional(map(object({
      partition_count    = number
      replication_factor = number
      configs           = map(string)
    })), {})
    kafka_acls = optional(map(object({
      acl_id     = string
      acl_entries = list(object({
        principal       = string
        permission_type = string
        operation       = string
        host            = string
      }))
    })), {})
  }))
}

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

variable "vcpu_count" {
  description = "Number of vCPUs"
  type        = number
}

variable "memory_bytes" {
  description = "Memory in bytes"
  type        = string
}

variable "access_config" {
  description = "Network access configuration"
  type = object({
    network_configs = list(object({
      subnet = string
    }))
  })
}

variable "labels" {
  description = "Labels to apply to the cluster"
  type        = map(string)
  default     = {}
}

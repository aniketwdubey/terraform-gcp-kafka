variable "region" {
  description = "GCP region"
  type        = string
}

variable "cluster_id" {
  description = "Kafka cluster ID (not the full path)"
  type        = string
}

variable "acl_id" {
  description = "ACL ID defining resource pattern. Format: 'topic/mytopic', 'group/mygroup', 'cluster', 'topic/prefix:mytopic-*'"
  type        = string
}

variable "acl_entries" {
  description = "List of ACL entries for this resource"
  type = list(object({
    principal       = string
    permission_type = string
    operation       = string
    host            = string
  }))
}

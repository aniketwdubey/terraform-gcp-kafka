resource "google_managed_kafka_acl" "acl" {
  acl_id   = var.acl_id
  cluster  = var.cluster_id
  location = var.region

  dynamic "acl_entries" {
    for_each = var.acl_entries
    content {
      principal       = acl_entries.value.principal
      permission_type = acl_entries.value.permission_type
      operation       = acl_entries.value.operation
      host            = acl_entries.value.host
    }
  }
}

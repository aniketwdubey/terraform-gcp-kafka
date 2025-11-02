output "acl_name" {
  description = "Full resource name of the ACL"
  value       = google_managed_kafka_acl.acl.name
}

output "acl_id" {
  description = "ACL ID"
  value       = google_managed_kafka_acl.acl.acl_id
}

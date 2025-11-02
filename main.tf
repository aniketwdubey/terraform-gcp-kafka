# Main Terraform configuration for GCP Managed Kafka

# Configure Google provider
provider "google" {
  project = var.project_id
  region  = var.region
}

# Create Kafka clusters
module "kafka_clusters" {
  source = "./modules/kafka-cluster"
  
  for_each = var.kafka_clusters

  project_id  = var.project_id
  region      = var.region
  cluster_id  = each.value.cluster_id
  
  # Capacity configuration
  vcpu_count         = each.value.vcpu_count
  memory_bytes       = each.value.memory_bytes
  
  # Network configuration
  access_config      = each.value.access_config
  
  labels = {}
}

# Create Kafka topics for each cluster
module "kafka_topics" {
  source = "./modules/kafka-topic"
  
  for_each = {
    for pair in flatten([
      for cluster_key, cluster in var.kafka_clusters : [
        for topic_key, topic in cluster.kafka_topics : {
          cluster_topic_key = "${cluster_key}_${topic_key}"
          cluster_key       = cluster_key
          topic_key         = topic_key
          topic_config      = topic
        }
      ]
    ]) : pair.cluster_topic_key => pair
  }

  project_id     = var.project_id
  region         = var.region
  cluster_id     = module.kafka_clusters[each.value.cluster_key].cluster_id
  topic_id       = each.value.topic_key
  partition_count = each.value.topic_config.partition_count
  replication_factor = each.value.topic_config.replication_factor
  configs        = each.value.topic_config.configs

  depends_on = [module.kafka_clusters]
}

# Create ACLs for each cluster
module "kafka_acls" {
  source = "./modules/kafka-acl"
  
  for_each = {
    for pair in flatten([
      for cluster_key, cluster in var.kafka_clusters : [
        for acl_key, acl in cluster.kafka_acls : {
          cluster_acl_key = "${cluster_key}_${acl_key}"
          cluster_key     = cluster_key
          acl_key         = acl_key
          acl_config      = acl
        }
      ]
    ]) : pair.cluster_acl_key => pair
  }

  region     = var.region
  cluster_id = module.kafka_clusters[each.value.cluster_key].cluster_id
  acl_id     = each.value.acl_config.acl_id
  acl_entries = each.value.acl_config.acl_entries

  depends_on = [module.kafka_clusters]
}

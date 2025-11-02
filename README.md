# Terraform GCP Managed Kafka

This Terraform project automates the provisioning and management of Google Cloud Managed Service for Apache Kafka clusters, topics, ACLs, and related resources.

## Features

- Automated Kafka cluster provisioning with configurable capacity
- Topic management with customizable partitions and replication
- ACL configuration for secure access control
- Remote state management with GCS backend
- Modular design for reusability

## Prerequisites

- Terraform >= 1.5.0
- Google Cloud SDK
- GCP Project with billing enabled
- Required APIs enabled:
  - managedkafka.googleapis.com
  - compute.googleapis.com

## Quick Start

1. Clone this repository
2. Copy `terraform.tfvars.example` to `terraform.tfvars` and configure values
3. Initialize Terraform:

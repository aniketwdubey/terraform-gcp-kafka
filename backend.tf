# Configure GCS backend for remote state storage
# Create the bucket before running terraform init
terraform {
  backend "gcs" {
    bucket = "machinemax-terraform-state"  # Change this to your bucket name
    prefix = "kafka/state"
    
    # Optional: Enable state locking (automatically enabled for GCS)
    # encryption_key = ""  # Optional: Customer-managed encryption key
  }
}

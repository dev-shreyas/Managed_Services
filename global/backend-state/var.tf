variable "region" {
  description = "The AWS region to deploy the infrastructure"
  default     = "ap-south-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket for Terraform state"
  default     = ["infra-mgmt.tfstate", "helm-charts.tfstate"]
  type        = list(string)
}

variable "lock_table" {
  description = "The name of the DynamoDB table for Terraform state locking"
  default     = "tfstate-locks"
}
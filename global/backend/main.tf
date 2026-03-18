provider "aws" {
  region = var.region
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "terraform_state" {
  count  = length(var.bucket_name)
  
  # Append random suffix to each bucket to ensure uniqueness
  bucket = "${var.bucket_name[count.index]}-${random_id.suffix.hex}"
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  count  = length(var.bucket_name)
  bucket = aws_s3_bucket.terraform_state[count.index].id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.lock_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
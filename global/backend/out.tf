output "bucket_name" {
  value = aws_s3_bucket.terraform_state[*].id
}

output "aws_dynamodb_table" {
  value = aws_dynamodb_table.terraform_locks.id
}
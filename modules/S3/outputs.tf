output "buckets_names" {
  value = values(aws_s3_bucket.s3_buckets)[*].id
}

output "buckets_arns" {
  value = values(aws_s3_bucket.s3_buckets)[*].arn
}
output "buckets_names" {
  value = aws_s3_bucket.s3_buckets.*.id
}

output "buckets_arns" {
  value = aws_s3_bucket.s3_buckets.*.arn
}
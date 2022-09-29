resource "aws_athena_database" "data_archive_athena_database" {
  name          = var.athena_database
  bucket        = aws_s3_bucket.lakeformation_s3_bucket.bucket
  force_destroy = var.force_destroy
}

resource "aws_athena_workgroup" "data_archive_athena_workgroup" {
  name = var.athena_workgroup
  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true
    result_configuration {
      output_location = "s3://${aws_s3_bucket.lakeformation_s3_bucket.bucket}/data_archive"

      encryption_configuration {
        encryption_option = "SSE_KMS"
        kms_key_arn       = aws_kms_key.data_archive_kms_key.arn
      }
    }
  }
  state         = "ENABLED"
  force_destroy = var.force_destroy
}
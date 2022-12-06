resource "aws_athena_database" "data_archive_athena_database" {
  for_each      = var.s3_bucket_names
  name          = "${each.value.database_name}_athena_database"
  bucket        = each.value.bucket_name
  force_destroy = var.force_destroy
}

resource "aws_athena_workgroup" "data_archive_athena_workgroup" {
  for_each = var.s3_bucket_names
  name     = "${each.value.database_name}_athena_workgroup"
  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true
    result_configuration {
      output_location = "s3://${each.value.bucket_name}/data_archive"

      encryption_configuration {
        encryption_option = "SSE_KMS"
        kms_key_arn       = aws_kms_key.data_archive_kms_key.arn
      }
    }
  }
  state         = "ENABLED"
  force_destroy = var.force_destroy
}
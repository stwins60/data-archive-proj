resource "aws_athena_database" "data_archive_athena_database" {
  count         = length(var.athena_database_names)
  name          = "${var.athena_database_names[count.index]}_athena_database"
  bucket        = module.data_archive_buckets.buckets_names[count.index]
  force_destroy = var.force_destroy
}

resource "aws_athena_workgroup" "data_archive_athena_workgroup" {
  count = length(var.athena_database_names)
  name  = "${var.athena_database_names[count.index]}_athena_workgroup"
  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true
    result_configuration {
      output_location = "s3://${module.data_archive_buckets.buckets_names[count.index]}/data_archive"

      encryption_configuration {
        encryption_option = "SSE_KMS"
        kms_key_arn       = aws_kms_key.data_archive_kms_key.arn
      }
    }
  }
  state         = "ENABLED"
  force_destroy = var.force_destroy
}
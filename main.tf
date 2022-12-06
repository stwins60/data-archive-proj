resource "aws_lakeformation_resource" "data_archive_lakeformation" {
  for_each = var.s3_bucket_names
  arn      = "arn:aws:s3:::${each.value.bucket_name}"
}

resource "aws_glue_crawler" "data_archive_crawler" {
  for_each      = var.s3_bucket_names
  name          = "${each.value.bucket_name}-crawler"
  role          = aws_iam_role.data_archive_crawler_role.arn
  database_name = aws_athena_database.data_archive_athena_database[each.key].name
  description   = "Crawler for data archive"
  s3_target {
    path = "s3://${each.value.bucket_name}/data-retention/"
  }
  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "LOG"
  }
  table_prefix = "data_archive_"
  tags = {
    Name = "data-archive-crawler"
  }
}
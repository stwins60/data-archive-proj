resource "aws_lakeformation_resource" "data_archive_lakeformation" {
  count = length(var.s3_buckets_names)
  arn   = module.data_archive_buckets.buckets_arns[count.index]
}

resource "aws_glue_crawler" "data_archive_crawler" {
  count         = length(var.s3_buckets_names)
  name          = "${var.s3_buckets_names[count.index]}-crawler"
  role          = aws_iam_role.data_archive_crawler_role.arn
  database_name = aws_athena_database.data_archive_athena_database[count.index].name
  description   = "Crawler for data archive"
  s3_target {
    path = "s3://${var.s3_buckets_names[count.index]}/data-retention/"
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
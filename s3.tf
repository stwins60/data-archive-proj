module "data_archive_buckets" {
  source          = "./modules/S3"
  for_each        = var.s3_bucket_names
  s3_bucket_names = var.s3_bucket_names
}
module "data_archive_buckets" {
  source          = "./modules/S3"
  s3_bucket_names = var.s3_buckets_names
}
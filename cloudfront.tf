module "cloudfront" {
  source = "./modules/Cloudfront"
    domain_name = "example.com"
  s3_bucket_names = var.s3_bucket_names

}
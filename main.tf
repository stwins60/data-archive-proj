resource "aws_lakeformation_resource" "data_archive_lakeformation" {
  arn = aws_s3_bucket.lakeformation_s3_bucket.arn
}

resource "aws_s3_bucket" "lakeformation_s3_bucket" {
  bucket        = var.lakeformation_s3_bucket
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_lifecycle_configuration" "s3_bucket_lifecycle" {
  bucket = aws_s3_bucket.lakeformation_s3_bucket.id

  rule {
    id     = "data_archive"
    status = "Enabled"

    expiration {
      days = 365
    }

    transition {
      days          = 120
      storage_class = "GLACIER"
    }
  }
}

resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = aws_s3_bucket.lakeformation_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.lakeformation_s3_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.lakeformation_s3_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
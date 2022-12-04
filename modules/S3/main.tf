resource "aws_s3_bucket" "s3_buckets" {
  count         = length(var.s3_bucket_names)
  bucket        = var.s3_bucket_names[count.index]
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_lifecycle_configuration" "s3_bucket_lifecycle" {
#  count  = length(var.s3_bucket_names)
#  bucket = var.s3_bucket_names[count.index].id
    count  = length(aws_s3_bucket.s3_buckets)
    bucket = aws_s3_bucket.s3_buckets[count.index].id
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
#  count  = length(var.s3_bucket_names)
#  bucket = var.s3_bucket_names[count.index].id
  count  = length(aws_s3_bucket.s3_buckets)
    bucket = aws_s3_bucket.s3_buckets[count.index].id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
#  count  = length(var.s3_bucket_names)
#  bucket = var.s3_bucket_names[count.index].id
  count  = length(aws_s3_bucket.s3_buckets)
    bucket = aws_s3_bucket.s3_buckets[count.index].id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
#  count                   = length(var.s3_bucket_names)
#  bucket                  = var.s3_bucket_names[count.index]
  count  = length(aws_s3_bucket.s3_buckets)
    bucket = aws_s3_bucket.s3_buckets[count.index].id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
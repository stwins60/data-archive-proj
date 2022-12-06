resource "aws_cloudfront_distribution" "cloudfront" {
  for_each = var.s3_bucket_names
  enabled = false
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    target_origin_id       = "${each.value.bucket_name}.s3.${var.region}.amazonaws.com"
    viewer_protocol_policy = "redirect-to-https"
  }
  origin {
    domain_name = "${each.value.bucket_name}.s3.${var.region}.amazonaws.com"
    origin_id   = "${each.value.bucket_name}.s3.${var.region}.amazonaws.com"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.s3_origin_access_identity.cloudfront_access_identity_path
    }
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

resource "aws_cloudfront_origin_access_identity" "s3_origin_access_identity" {
    comment = "S3 Origin Access Identity"
}
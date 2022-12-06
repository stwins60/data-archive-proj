resource "aws_s3_bucket_policy" "cloudfront_bucket_policy" {
  for_each = var.s3_bucket_names
  bucket = each.value.bucket_name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AWSCloudFrontOriginAccessIdentity${aws_cloudfront_origin_access_identity.s3_origin_access_identity.id}",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : aws_cloudfront_origin_access_identity.s3_origin_access_identity.iam_arn
        },
        "Action" : "s3:GetObject",
        "Resource" : "arn:aws:s3:::${each.value.bucket_name}/*"
      }
    ]
  })
}
resource "aws_route53_record" "s3_distribution" {
  for_each = var.s3_bucket_names
  zone_id = aws_route53_zone.s3_distribution.zone_id
  name    = "${each.value.bucket_name}.${aws_route53_zone.s3_distribution.zone_id}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.cloudfront[each.key].domain_name
    zone_id                = aws_cloudfront_distribution.cloudfront[each.key].hosted_zone_id
    evaluate_target_health = false
  }
}

# create a route53 zone for the cloudfront distribution
resource "aws_route53_zone" "s3_distribution" {
  name = var.domain_name
}
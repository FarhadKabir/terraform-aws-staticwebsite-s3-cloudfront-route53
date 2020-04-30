data "aws_route53_zone" "hosted_zone" {
  name         = var.hosted_zone_name
  private_zone = false
}

resource "aws_route53_record" "a_record" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = var.record_name
  type    = "A"

  alias {
    name                    = aws_s3_bucket.hosted_zone.website_domain
    zone_id                 = aws_s3_bucket.hosted_zone.hosted_zone_id
    evaluate_target_health  = false
  }
}

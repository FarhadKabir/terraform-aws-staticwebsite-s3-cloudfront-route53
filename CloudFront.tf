# Find a certificate that is issued
data "aws_acm_certificate" "ssl_cert" {
  domain      = var.hosted_zone_name
}

resource "aws_cloudfront_distribution" "cloudfront_s3" {
  origin {
    origin_id   = "${var.record_name}.${var.hosted_zone_name}"
    domain_name = aws_s3_bucket.static_web.bucket_domain_name
  }

  # If using route53 aliases for DNS we need to declare it here too, otherwise $
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  
  aliases             = ["${var.record_name}.${var.hosted_zone_name}"]
  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.record_name}.${var.hosted_zone_name}"

    forwarded_values {
      query_string = false
      cookies {
       forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    compress               = "true"
    min_ttl                = 0
    default_ttl            = 10
    max_ttl                = 60
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  # SSL certificate for the service.
  viewer_certificate {
    acm_certificate_arn            = data.aws_acm_certificate.ssl_cert.arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.1_2016"
  }
  
  depends_on = [data.aws_acm_certificate.ssl_cert]
}


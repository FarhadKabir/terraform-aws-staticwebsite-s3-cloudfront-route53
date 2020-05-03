output "record_name" {
  value = aws_route53_record.a_record.name
}

output "bucket_arn" {
  value = aws_s3_bucket.static_web.arn
}

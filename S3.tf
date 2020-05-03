resource "aws_s3_bucket" "static_web" {
  bucket = "${var.record_name}.${var.hosted_zone_name}"
  acl = "public-read"
  force_destroy = true
  versioning {
    enabled = true
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_policy" "s3_upload_firmware_policy" {
  bucket = aws_s3_bucket.static_web.id

  policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddPerm",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${var.record_name}.${var.hosted_zone_name}/*"]
      }
  ]
}
EOF
}

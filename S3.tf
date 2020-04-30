resource "aws_s3_bucket" "static_web" {
  bucket = var.bucket_name
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

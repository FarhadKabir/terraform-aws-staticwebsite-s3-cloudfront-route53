variable "bucket_name" {
   type        = string
   description = "Name for aws s3 bucket"
}

variable "aws_region" {
   type        = string
   description = "Main region for aws services"
}

variable "hosted_zone_name" {
   type        = string
   description = "Hosted zone name"
}

variable "record_name" {
   type        = string
   description = "Complete name for record that needs to be added in Route53"
}

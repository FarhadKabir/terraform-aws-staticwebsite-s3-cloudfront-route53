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

variable "build_folder" {
   type        = string
   description = "Give path for build folder to upload to S3"
}

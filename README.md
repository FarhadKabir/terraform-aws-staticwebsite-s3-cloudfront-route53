# terraformawss3
Simple terraform module that can be used to deploy a static react based application to AWS. This module upload the app to S3 and make it available over a Route53 record.
It also makes use of Cloudfront distribution and attaches SSL certificate for your domain.
##Example Usage


```
module "staticweb" {
  source           = "terraformawss3"
  aws_region       = "us-east-1"                 
  hosted_zone_name = "yourdomain.com"            //name of hosted zone
  record_name      = "record1"                   //name of route53 a record, to e created
  build_folder     = "build/"
}
```

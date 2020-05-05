# terraformawss3
simple terraform module that can be used to deploy a static react based application to aws

```
module "staticweb" {
  source           = "terraformawss3"
  aws_region       = "us-east-1"                 
  hosted_zone_name = "yourdomain.com"            //name of hosted zone
  record_name      = "record1"                   //name of route53 a record, to e created
  build_folder     = "build/"
}
```

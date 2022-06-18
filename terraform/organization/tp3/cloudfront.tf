# ---------------------------------------------------------------------------
# Amazon Cloudfront resources
# ---------------------------------------------------------------------------

module "cloudfront" {
  source   = "../../modules/cloudfront"

  web_acl_id                   = module.waf.aws_waf_web_acl_id

  s3_domain_name               = local.cloudfront.s3_domain_name
  s3_origin_id                 = local.cloudfront.s3_origin_id

  apigw_domain_name            = local.cloudfront.apigw_domain_name
  apigw_origin_id              = local.cloudfront.apigw_origin_id
  apigw_origin_path            = local.cloudfront.apigw_origin_path

  logs_s3_bucket_name          = module.s3["logs"].domain_name
}




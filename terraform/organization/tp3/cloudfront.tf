# ---------------------------------------------------------------------------
# Amazon Cloudfront resources
# ---------------------------------------------------------------------------
resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = module.s3["website"].id
}

module "cloudfront" {
  source   = "../../modules/cloudfront"

  providers = {
    aws = aws.aws
  }

  web_acl_id                   = module.waf.aws_waf_web_acl_id

  s3_domain_name               = local.cloudfront.s3_domain_name
  s3_origin_id                 = local.cloudfront.s3_origin_id
  s3_origin_access_identity    = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path

  apigw_domain_name            = local.cloudfront.apigw_domain_name
  apigw_origin_id              = local.cloudfront.apigw_origin_id
  apigw_origin_path            = local.cloudfront.apigw_origin_path
  apigw_origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path

  logs_s3_bucket_name          = module.s3["logs"].domain_name
}




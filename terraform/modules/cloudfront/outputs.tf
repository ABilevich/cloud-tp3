# --------------------------------------------------------------------
# Amazon Cloudfront buckets output
# --------------------------------------------------------------------

output "access_oai_path" {
  value = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
}

output "access_oai" {
  value = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
}
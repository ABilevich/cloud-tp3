# ---------------------------------------------------------------------------
# Main resources
# ---------------------------------------------------------------------------

data "aws_region" "current" {
  provider = aws.aws
}

data "aws_caller_identity" "current" {
  provider = aws.aws
}

# TODO: Falta
# data "aws_iam_policy_document" "api_gateway" {
#   statement {
#     actions   = ["s3:GetObject"]
#     resources = ["${aws_s3_bucket.this.www.arn}/*"]

#     principals {
#       type        = "AWS"
#       identifiers = var.bucket_access_OAI
#     }
#   }
# }

data "template_file" "userdata" {
  template = file("${path.module}/html/index.html")
  vars = {
    ENDPOINT = "${module.api_gateway.api_endpoint}"
  }
}
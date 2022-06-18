# ---------------------------------------------------------------------------
# Amazon API Gateway
# ---------------------------------------------------------------------------

module "api_gateway" {
  source            = "../../modules/api_gateway_2"

  # resource_tag_name = var.resource_tag_name
  # namespace         = var.namespace
  # region            = data.aws_region.current.name

  api_name                   = local.api_gateway.name
  # api_throttling_rate_limit  = var.api_throttling_rate_limit
  # api_throttling_burst_limit = var.api_throttling_burst_limit
  api_template               = file(local.openapi.filename)
  api_template_vars = {
    region = data.aws_region.current.name

    # cognito_user_pool_arn = module.cognito.cognito_user_pool_arn

    # lambda_identity_arn     = module.identity.lambda_arn
    # lambda_identity_timeout = var.lambda_identity_api_timeout

    # lambda_user_arn     = module.user.lambda_arn
    # lambda_user_timeout = var.lambda_user_api_timeout
  }

  # lambda_zip_name = local.lambda.zip_name
  # dist_file_path  = local.dist_file_path # TODO(matías): que es esto
}
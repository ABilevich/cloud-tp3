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
  # api_template               = file(local.openapi.filename)
  api_template                 = jsonencode({
    openapi = "3.0.1"
    info = {
      title   = "Example"
      version = "1.0"
    }
    paths = {
      "/user" = {
        get = {
          x-amazon-apigateway-integration = {
            httpMethod           = "GET"
            payloadFormatVersion = "1.0"
            type                 = "AWS_PROXY"
            uri                  = module.lambda["getUsers"].invoke_arn
          }
        }
      }
    }
  })
  api_template_vars = {
    lambda_invoke_arn = module.lambda["getUsers"].invoke_arn

    # api_name = local.name

    # aws_region = data.aws_region.current.name
    # aws_caller_identity_account_id = data.aws_caller_identity.current.account_id
    # api_gateway_id = module.api_gateway.id


    # cognito_user_pool_arn = module.cognito.cognito_user_pool_arn

    # lambda_identity_arn     = module.identity.lambda_arn
    # lambda_identity_timeout = var.lambda_identity_api_timeout

    # lambda_user_arn     = module.user.lambda_arn
    # lambda_user_timeout = var.lambda_user_api_timeout
  }

  # lambda_zip_name = local.lambda.zip_name
  # dist_file_path  = local.dist_file_path # TODO(matías): que es esto
}
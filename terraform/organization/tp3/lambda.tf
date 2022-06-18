# ---------------------------------------------------------------------------
# AWS Lambda resources
# ---------------------------------------------------------------------------

module "lambda" {
  source = "../../modules/lambda"

  lambdas                        = local.lambda.lambdas.hortzIsBetter # TODO(it is supposed to receive a map of lambdas)
  aws_region                     = data.aws_region.current.name
  aws_caller_identity_account_id = data.aws_caller_identity.current.id
  api_gateway_id                 = module.api_gateway.id
  api_gateway_http_method        = module.api_gateway.http_method
  api_gateway_resource_path      = module.api_gateway.resource_path
}
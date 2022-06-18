# ---------------------------------------------------------------------------
# Amazon API Gateway
# ---------------------------------------------------------------------------

module "api_gateway" {
  source = "../../modules/api_gateway"
  
  name       = local.api_gateway.name
  lambda_invoke_arn = module.lambda.invoke_arn
}
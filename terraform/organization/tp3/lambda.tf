# ---------------------------------------------------------------------------
# AWS Lambda resources
# ---------------------------------------------------------------------------

module "lambda" {
  for_each = local.lambda.lambdas

  source = "../../modules/lambda"

  aws_region                     = data.aws_region.current.name
  aws_caller_identity_account_id = data.aws_caller_identity.current.id
  api_gateway_id                 = module.api_gateway.id
  api_gateway_execution_arn      = module.api_gateway.execution_arn 

  filename                       = local.lambda.zip_filename
  method                         = each.value.method
  name                           = each.value.name
  handler                        = each.value.handler
  runtime                        = each.value.runtime
  path                           = each.value.path
}
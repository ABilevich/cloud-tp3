# ---------------------------------------------------------------------------
# Amazon Lambda resources
# ---------------------------------------------------------------------------

# Lambda
# TODO(matías): This should be a better version (for_each)
resource "aws_lambda_function" "this" {
  filename      = var.lambdas.filename
  function_name = var.lambdas.name
  role          = "arn:aws:iam::${var.aws_caller_identity_account_id}:role/LabRole"
  handler       = var.lambdas.handler
  runtime       = var.lambdas.runtime
}

resource "aws_lambda_permission" "this" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.lambdas.name
  principal     = "apigateway.amazonaws.com" # TODO(matías): que sería esto?

  # TODO(matías): We have to replace arn I guess
  source_arn = "arn:aws:execute-api:${var.aws_region}:${var.aws_caller_identity_account_id}:${var.api_gateway_id}/*/${var.api_gateway_http_method}${var.api_gateway_resource_path}"
}
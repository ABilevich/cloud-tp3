# ---------------------------------------------------------------------------
# Amazon Lambda resources
# ---------------------------------------------------------------------------

# Lambda
# TODO(matías): This should be a better version (for_each)
resource "aws_lambda_function" "this" {
  filename      = var.filename
  function_name = var.name
  role          = "arn:aws:iam::${var.aws_caller_identity_account_id}:role/LabRole"
  handler       = var.handler
  runtime       = var.runtime
}

resource "aws_lambda_permission" "this" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.name
  principal     = "apigateway.amazonaws.com"

  # source_arn = "arn:aws:execute-api:${var.aws_region}:${var.aws_caller_identity_account_id}:${var.api_gateway_id}/*/${var.method}${var.name}"
  source_arn = "${var.api_gateway_execution_arn}/*/${var.method}/${var.path}"
}
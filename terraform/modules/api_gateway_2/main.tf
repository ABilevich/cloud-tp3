# ---------------------------------------------------------------------------
# Amazon API Gateway resources
# ---------------------------------------------------------------------------

resource "aws_api_gateway_rest_api" "this" {
  name           = var.api_name
  description    = var.api_description
  api_key_source = "HEADER"

  body = data.template_file.this.rendered

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_stage" "this" {
  deployment_id = aws_api_gateway_deployment.this.id
  rest_api_id   = aws_api_gateway_rest_api.this.id
  stage_name    = "production"
}

resource "aws_api_gateway_deployment" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.this.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}
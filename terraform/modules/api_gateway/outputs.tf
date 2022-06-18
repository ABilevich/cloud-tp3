# ---------------------------------------------------------------------------
# Amazon API Gateway outputs
# ---------------------------------------------------------------------------

output "id" {
  value = aws_api_gateway_rest_api.this.id
}

output "http_method" {
  value = aws_api_gateway_method.this.http_method
}

output "resource_path" {
  value = aws_api_gateway_resource.this.path
}

output "api_endpoint" {
  value = aws_api_gateway_stage.this.invoke_url
}
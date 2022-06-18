output "api_gateway_endpoint" {
  description = "API Gateway Endpoint"
  value       = module.api_gateway.api_endpoint
}

output "cloudfront_endpoint" {
  description = "Cloudfront Endpoint"
  value       = module.cloudfront.domain_name
}

output "lambda_create_user_invoke_arn" {
  value       = module.lambda["createUser"].invoke_arn
}

output "lambda_create_user_source_arn" {
  value       = module.lambda["createUser"].source_arn
}
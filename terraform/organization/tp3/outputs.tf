output "app" {
  description = "App"
  value       = {
    domain_name = local.app_domain_name
    api_gateway = {
      url = module.api_gateway.api_endpoint
    }
    cloudfront = {
      url = module.cloudfront.domain_name
    }
  }
}
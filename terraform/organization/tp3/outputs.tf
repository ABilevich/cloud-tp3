output "app" {
  description = "App"
  value       = {
    domain      = local.app_domain_name
    url         = "https://${local.app_domain_name}"
    api_gateway = {
      domain = module.api_gateway.api_endpoint
    }
    cloudfront  = {
      url    = module.cloudfront.domain_name
    }
  }
}

# output "lambdas" {
#   value = local.lambdas_endpoints_iterable
# }
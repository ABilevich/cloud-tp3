# ---------------------------------------------------------------------------
# Amazon Lambda variables
# ---------------------------------------------------------------------------

variable "aws_region" {
  type        = string
  description = ""
}

variable "aws_caller_identity_account_id" {
  type        = string
  description = ""
}

variable "api_gateway_id" {
  type        = string
  description = ""
}

variable "api_gateway_http_method" {
  type        = string
  description = ""
}

variable "api_gateway_resource_path" {
  type        = string
  description = ""
}

variable "lambdas" {
  type        = map(any)
  description = ""
  default     = {}
}
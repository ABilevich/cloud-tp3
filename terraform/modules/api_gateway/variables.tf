# ---------------------------------------------------------------------------
# Amazon API Gateway variables
# ---------------------------------------------------------------------------

variable "name" {
  type        = string
  description = "The name of the api gateway. Must be less than or equal to 63 characters in length."
}

# TODO(matías): In the future, we should be using a map of lambdas?
variable "lambda_invoke_arn" {
  type        = string
  description = "Lambda arn"
}
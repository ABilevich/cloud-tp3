# ---------------------------------------------------------------------------
# Amazon Lambda outputs
# ---------------------------------------------------------------------------

output "invoke_arn" {
  value = aws_lambda_function.this.invoke_arn
}

output "source_arn" {
  value = aws_lambda_permission.this.source_arn
}
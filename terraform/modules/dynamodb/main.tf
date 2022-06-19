# ---------------------------------------------------------------------------
# Amazon DynamoDB resources
# ---------------------------------------------------------------------------

# Still have to iterate properly for each attribute in table and so
resource "aws_dynamodb_table" "this" {
  for_each = var.tables

  name = "${var.name_prefix}${each.key}-${var.app_name}"
  billing_mode = "PROVISIONED"
  read_capacity= "30"
  write_capacity= "30"
  attribute {
      name = "carId"
      type = "S"
  }
  hash_key = "carId"
}
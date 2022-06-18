resource "aws_dynamodb_table" "tf_cars_table" {
    name = local.dynamodb.name
    billing_mode = "PROVISIONED"
    read_capacity= "30"
    write_capacity= "30"
    attribute {
        name = "carId"
        type = "S"
    }
    hash_key = "carId"
}

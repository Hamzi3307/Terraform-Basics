resource "aws_dynamodb_table" "cars" {
  name = "cars"
  hash_key = "VIN"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "VIN"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "car-item" {
  table_name = aws_dynamodb_table.cars.name
  hash_key = aws_dynamodb_table.cars.hash_key
  item = <<EOF
  {
    "Manufacturer" : {"S": "Toyota"},
    "YEAR" : {"N": "2004"},
    "VIN" : {"S": "SQ3RFNJCBEFIN"}
  }
  EOF
}
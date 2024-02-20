resource "aws_dynamodb_table" "task2" {
  name = "user-data"
  hash_key = "UserID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "Name"
    type = "S"
  }
}

//Step 2:
# resource "aws_dynamodb_table" "task2" {
#   name = "user-data"
#   hash_key = "UserID"
#   billing_mode = "PAY_PER_REQUEST"
#   attribute {
#     name = "UserID"
#     type = "S"
#   }
# }


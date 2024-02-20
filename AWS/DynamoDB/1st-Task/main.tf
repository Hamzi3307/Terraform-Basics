resource "aws_dynamodb_table" "task1" {
  name = "inventory"
  hash_key = "AssetID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "AssetID"
    type = "N"
  }
  attribute {
    name = "AssetName"
    type = "S"
  }
  attribute {
    name = "age"
    type = "N"
  }
  attribute {
    name = "Hardware"
    type = "B"
  }
  global_secondary_index {
    name = "AssetName"
    hash_key = "AssetName"
    projection_type = "ALL"
  }
  global_secondary_index {
    name = "age"
    hash_key = "age"
    projection_type = "ALL" 
  }
  global_secondary_index {
    name = "Hardware"
    hash_key = "Hardware"
    projection_type = "ALL"
  }
}
provider "aws" {
  region  = "ap-south-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "demo-tf-anekh"
  
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "tf-state-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

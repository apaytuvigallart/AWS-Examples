resource "random_id" "random_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-bucket-${random_id.random_suffix.hex}"
}

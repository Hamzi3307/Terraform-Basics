resource "aws_s3_bucket" "buckets" {
  bucket = var.bucket-name
}

resource "aws_s3_object" "upload" {
  bucket = var.bucket-name
  key = "woody.jpg"
  source = "./woody.jpg" 
  depends_on = [ aws_s3_bucket.buckets ]
}
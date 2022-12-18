variable "aws_access_key" {
  description = "AWS access key"
  type = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type = string
}

provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "us-east-1"
}

# resource "aws_s3_bucket_website_configuration" "example" {
#   bucket = aws_s3_bucket.example.bucket

#   index_document {
#     suffix = "index.html"
#   }
# }

resource "aws_s3_bucket" "firebase-static-gd548241h52s5" {
  bucket = "${aws_s3_bucket.name}"
#   acl = "public-read"
#   policy = file("policy.json")

#   website {
#     index_document = "index.html"
#   }
}

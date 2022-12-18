variable "aws_access_key" {
    description = "AWS access key"
    type = string
}

variable "aws_secret_key" {
    description = "AWS secret key"
    type = string
}

variable "s3_resource_name" {
    description = "S3 bucket name"
    type = string
    default = "firebase-static-222gd548241h52s5"
}

provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "us-east-1"
}

resource "aws_s3_bucket" "main_s3_bucket" {
    bucket = "${var.s3_resource_name}"
    acl = "public-read"
    policy = <<-EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "allow-showing-site",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${var.s3_resource_name}/*"
        }
    ]
}
    EOF

    website {
        index_document = "index.html"
    }
}

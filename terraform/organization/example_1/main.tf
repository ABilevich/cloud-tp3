# ---------------------------------------------------------------------------
# Main resources - baseline configuration for s3
# ---------------------------------------------------------------------------

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_website_configuration" "this" {
    bucket = aws_s3_bucket.this.id

    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "error.html"
    }
}

resource "aws_s3_bucket_acl" "this" {
    bucket = aws_s3_bucket.this.id
    acl    = "public-read"
}

resource "aws_s3_object" "bucket_main" {
    key          = "index.html"
    bucket       = aws_s3_bucket.this.id
    source       = "../../resources/html/index.html"
    content_type = "text/html"
}

resource "aws_s3_object" "bucket_error" {
    key          = "error.html"
    bucket       = aws_s3_bucket.this.id
    source       = "../../resources/html/error.html"
    content_type = "text/html"
}

resource "aws_s3_object" "hortz" {
    key    = "images/hortz.png"
    bucket = aws_s3_bucket.this.id
    source = "../../resources/images/hortz.png"
}
# ---------------------------------------------------------------------------
# Main resources - baseline configuration for s3
# ---------------------------------------------------------------------------

resource "aws_s3_bucket" "this" {
    bucket = var.bucket_name
    acl    = "public-read"
    policy = file("../../resources/policy.json")

    website {
        index_document = "index.html"
        error_document = "error.html"
    }
}

resource "aws_s3_bucket_object" "bucket_main" {
    key          = "index.html"
    bucket       = aws_s3_bucket.this.id
    source       = "../../resources/html/index.html"
    content_type = "text/html"
}

resource "aws_s3_bucket_object" "bucket_error" {
    key          = "error.html"
    bucket       = aws_s3_bucket.this.id
    source       = "../../resources/static website/error.html"
    content_type = "text/html"
}

resource "aws_s3_bucket_object" "hortz" {
    key    = "images/image1.png"
    bucket = aws_s3_bucket.this.id
    source = "../../resources/static website/images/hortz.png"
}
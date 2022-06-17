# ---------------------------------------------------------------------------
# Main resources - adding a for_each and variables
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

resource "aws_s3_object" "html" {
    for_each     = toset(["index.html", "error.html"])
    
    key          = each.key
    bucket       = aws_s3_bucket.this.id
    source       = "${var.path}/html/${each.key}"
    content_type = "text/html"
}

resource "aws_s3_object" "images" {
    for_each = toset(["hortz.png", "pepe.png"])

    key      = "images/${each.key}"
    bucket   = aws_s3_bucket.this.id
    source   = "${var.path}/images/${each.key}"
}
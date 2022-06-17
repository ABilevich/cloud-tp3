locals {
  bucket_name = "a211201d-81d3-475c-8452-ac5f6a3e43e8-cloud-tp3"
  path        = "../../resources"

  s3 = {

    # 1 - Website
    website = {
      bucket_name = local.bucket_name
      path        = "../../resources"

      objects = {
        error = {
          filename     = "html/error.html"
          content_type = "text/html"
        }
        hortz = {
          filename     = "images/hortz.png"
          content_type = "image/png"
        }
        pepe = {
          filename     = "images/pepe.png"
          content_type = "image/png"
        }
      }
    }

    # 2 - WWW Website
    www-website = {
      bucket_name = "www.${local.bucket_name}"
    }
  }
}
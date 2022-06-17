locals {
  name   = "cloud-tp3"
  region = "us-east-1" 
  path   = "../../resources"

  vpc = {
    name = "vpc-${local.name}"
  }

  api_gateway = {
    name = "api-gw-${local.name}"
  }

  s3 = {

    # 1 - Website
    website = {
      bucket_name = "bucket-s3-${local.name}"
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
      bucket_name = "www.bucket-s3-${local.name}"
    }
  }

  lambda = {
    name = "lambda-${local.name}"
  }
  
  aurora = {
    name = "aurora-rds-${local.name}"
    tags = {
      "Name": "Aurora RDS Serverless PostgreSQL"
    }
  }
}
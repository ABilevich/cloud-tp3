locals {
  # Run with env var: export TF_VAR_PREFIX="gabi"
  name   = "${var.name_prefix}-itba-2022-cloud-g3-tp3"

  path = {
    resources = "../../resources"
  }

  vpc = {
    name               = "vpc-${local.name}"
    cidr               = "10.0.0.0/16"
    availability_zones = ["${data.aws_region.current.name}a", "${data.aws_region.current.name}b"]
    public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnets    = ["10.0.11.0/24", "10.0.12.0/24"]
    database_subnets   = ["10.0.21.0/24", "10.0.22.0/24"]
  }


  waf = {
    web_acl_name = "waf-${local.name}"
    web_acl_metics = "myFirstwebaclmetics"
    waf_rule_name = "myFirstwafrulename"
    waf_rule_metrics = "myFirstwafrulemetrics"
    waf_rule_group_name = "myFirstwaf_rule_group_name"
    waf_rule_group_metrics = "myFirstwafrulgroupmetrics"
  }

  s3 = {

    # 1 - WWW Website
    www-website = {
      bucket_name = "www.bucket-s3-${local.name}"
    }

    # 2 - Website
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

    # 3 - Logs
    logs = {
      bucket_name = "logs-bucket-s3-${local.name}"
    }
  }

  lambdas_filename = "${local.path.resources}/lambda/lambda.zip"

  openapi = {
    filename = "../../resources/openapi/hortz.yaml"
  }

  api_gateway = {
    name = "api-gw-${local.name}"
  }

  lambda = {
    lambdas = {
      getUsers = {
        filename = "${local.path.resources}/lambda/lambda.zip"
        method   = "GET"
        name     = "lambda-getUsers-${local.name}"
        handler  = "lambda_handler.main"
        runtime  = "python3.9"
        path     = "users"
      }
    }
  }
  
  aurora = {
    name = "aurora-rds-${local.name}"
    tags = {
      "Name": "Aurora RDS Serverless PostgreSQL"
    }
  }

  dynamodb = {
    name = "dynamodb-${local.name}"
    tags = {
      "Name": "Dynamo DB"
    }
  }

  cloudfront = {
    s3_domain_name = module.s3["website"].domain_name
    s3_origin_id   = "s3-bucket"
    apigw_domain_name = split("/", module.api_gateway.api_endpoint)[2] # TODO: Está horrible pero funcional
    apigw_origin_id   = split("/", module.api_gateway.api_endpoint)[2]
    apigw_origin_path = "/${split("/", module.api_gateway.api_endpoint)[length(split("/", module.api_gateway.api_endpoint))-1]}"
  }
  
}
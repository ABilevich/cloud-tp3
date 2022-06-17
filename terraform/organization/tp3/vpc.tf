module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.vpc.name
  cidr = "10.0.0.0/16"

  azs              = ["${local.region}a", "${local.region}b"]
  public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets  = ["10.0.11.0/24", "10.0.12.0/24"]
  database_subnets = ["10.0.21.0/24", "10.0.22.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "production"
  }
}
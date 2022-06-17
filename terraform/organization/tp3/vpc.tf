# ---------------------------------------------------------------------------
# Amazon VPC resources
# ---------------------------------------------------------------------------

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.vpc.name
  cidr = local.vpc.cidr

  azs              = local.vpc.availability_zones
  public_subnets   = local.vpc.public_subnets
  private_subnets  = local.vpc.private_subnets
  database_subnets = local.vpc.database_subnets

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "production"
  }
}
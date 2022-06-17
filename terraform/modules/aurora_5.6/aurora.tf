data "aws_rds_engine_version" "postgresql" {
  engine  = "aurora-postgresql"
  version = "13.6"
}

module "aurora_postgresql_serverlessv2" {
  source            = "terraform-aws-modules/rds-aurora/aws"
  name              = "${local.aurora.name}-postgresqlv2"
  engine            = data.aws_rds_engine_version.postgresql.engine
  engine_mode       = "provisioned"
  engine_version    = data.aws_rds_engine_version.postgresql.version
  storage_encrypted = true

  vpc_id                = module.vpc.vpc_id
  subnets               = module.vpc.database_subnets
  create_security_group = true
  allowed_cidr_blocks   = module.vpc.private_subnets_cidr_blocks

  monitoring_interval = 60

  apply_immediately   = true
  skip_final_snapshot = true

  db_parameter_group_name         = aws_db_parameter_group.example_postgresql13.id
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.example_postgresql13.id

  serverlessv2_scaling_configuration = {
    min_capacity = 2
    max_capacity = 10
  }

  instance_class = "db.serverless"
  instances = {
    one = {}
    two = {}
  }
}

resource "aws_db_parameter_group" "example_postgresql13" {
  name        = "${local.name}-aurora-db-postgres13-parameter-group"
  family      = "aurora-postgresql13"
  description = "${local.name}-aurora-db-postgres13-parameter-group"
  tags        = local.aurora.tags
}

resource "aws_rds_cluster_parameter_group" "example_postgresql13" {
  name        = "${local.name}-aurora-postgres13-cluster-parameter-group"
  family      = "aurora-postgresql13"
  description = "${local.name}-aurora-postgres13-cluster-parameter-group"
  tags        = local.aurora.tags
}
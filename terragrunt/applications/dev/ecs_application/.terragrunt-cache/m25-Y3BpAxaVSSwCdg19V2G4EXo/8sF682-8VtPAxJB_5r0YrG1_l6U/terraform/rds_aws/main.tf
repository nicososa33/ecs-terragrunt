module "cluster" {
  source  = "terraform-aws-modules/rds-aurora/aws"

  name           = "dev-aurora-db-postgres96"
  engine         = "aurora-postgresql"
  engine_version = "14.5"
  instance_class = var.aws_instance_class #"db.t3.medium"
  instances = {
    one = {}
    2 = {
      #instance_class = var.aws_instance_class #"db.t3.medium"
    }
  }

  vpc_id               = var.vpc_id
  db_subnet_group_name = "subnet-dev-ecs"
  security_group_rules = {
    ex1_ingress = {
      cidr_blocks = ["10.20.0.0/20"]
    }
    ex1_ingress = {
      source_security_group_id = "sg-dev-ecs"
    }
  }

  storage_encrypted   = true
  apply_immediately   = true
  monitoring_interval = 10

  enabled_cloudwatch_logs_exports = ["postgresql"]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
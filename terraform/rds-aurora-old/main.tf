module "cluster" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "8.3.1"

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
  db_subnet_group_name = aws_db_subnet_group.vpc_subnet_module.name
  #var.create_db_subnet_group ? try(aws_db_subnet_group.db-sng[0].name, null) : local.internal_db_subnet_group_name 
  
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

resource "aws_db_subnet_group" "vpc_subnet_module" {
  #count = local.cluster && var.create_db_subnet_group ? 1 : 0
  
  name       = "vpc_subnet_module"
  subnet_ids = module.vpc_subnet_module.private_subnets
  tags = {
    Name = "vpc_subnet_module"
  }
}

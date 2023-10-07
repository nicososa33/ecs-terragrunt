module "cluster" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "8.3.1"

  name           = var.rds.name
  engine         = var.rds.engine
  engine_version = var.rds.engine_version
  instance_class = var.rds.instance_class
  instances = {
    one = {}
    2 = {
      instance_class = var.rds.instance_class
    }
  }

  vpc_id               = var.rds.vpc_id
  db_subnet_group_name = aws_db_subnet_group.default.name #"db-subnet-group"
#   security_group_rules = {
#     ex1_ingress = {
#       cidr_blocks = ["10.20.0.0/20"]
#     }
#     ex1_ingress = {
#       source_security_group_id = "sg-12345678"
#     }
#  }

  storage_encrypted   = true
  apply_immediately   = true
  monitoring_interval = 10

  enabled_cloudwatch_logs_exports = ["postgresql"]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = var.name
  subnet_ids = var.private_subnet_ids

  tags = var.tag_info
}
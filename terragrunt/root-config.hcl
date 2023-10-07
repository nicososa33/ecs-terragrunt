locals {
  region = "us-west-2"

  version_terraform    = " >= 1.0, <= 1.5.7 "
  version_terragrunt   = "=0.51.4"
  version_provider_aws = " >=4.67.0"

  root_tags = {
    project = "ecs-terraform-terragrunt"
  }
}

generate "provider_global" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  required_version = "${local.version_terraform}"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "${local.version_provider_aws}"
    }
  }
}

provider "aws" {
  region = "${local.region}"
}
EOF
}


remote_state {
  backend = "s3"
  config = {
    bucket         = "terragruntdev-12345"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    encrypt        = true
    region         = local.region
    dynamodb_table = "terraform-locks-table"
  }
}
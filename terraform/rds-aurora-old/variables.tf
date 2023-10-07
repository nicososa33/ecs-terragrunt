variable "vpc_id" {
  type = string
}

variable "aws_security_group_egress_all" {
  type = object({
    name        = string
    description = string
    vpc_id      = string
  })
}

variable "vpc_private_subnets_ids" {
  type = list(string)
  }

variable "aws_instance_class" {
  type = string
  }
  
variable "subnets_ids" {
  type = string
  }

################################################################################
# DB Subnet Group
################################################################################

variable "create_db_subnet_group" {
  description = "Determines whether to create the database subnet group or use existing"
  type        = bool
  default     = false
}

variable "db_subnet_group_name" {
  description = "The name of the subnet group name (existing or created)"
  type        = string
  default     = ""
}

variable "subnets" {
  description = "List of subnet IDs used by database subnet group created"
  type        = list(string)
  default     = []
}

variable "create" {
  description = "Whether cluster should be created (affects nearly all resources)"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name used across resources created"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

# variable "vpc_private_subnets_ids" {
#   type        = list(any)
#   description = "Private subnet IDs associate with RDS Instance Subnet Group"
# }
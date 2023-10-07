variable "rds" {
  type = object(
    {
      name                 = string
      engine               = string
      engine_version       = string
      instance_class       = string

      vpc_id               = string
    }
    )

  description = "Variables RDS"
}

variable "private_subnet_ids" {
  type        = list(any)
  description = "Private subnet IDs associate with RDS Instance Subnet Group"
}

variable "tag_info" {
  type        = map(any)
  default     = {}
  description = " A map of tags to assign to the resource."
}

variable "name" {
  description = "Prefix used to create resource names."
  type        = string
}
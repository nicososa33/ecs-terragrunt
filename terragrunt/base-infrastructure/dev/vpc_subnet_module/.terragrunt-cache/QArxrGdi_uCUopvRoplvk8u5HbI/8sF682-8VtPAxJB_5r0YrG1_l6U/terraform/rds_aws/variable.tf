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

#variable "vpc_subnet_module" {
#  type = object({
#    private_subnets      = list(string)
#  })
#}

variable "private_subnets" {
  type = list(string)
  }

variable "aws_instance_class" {
  type = string
  }
  
variable "vpc_subnet_module" {
  type = object({
    name                 = string
    cidr_block           = string
    azs                  = list(string)
    private_subnets      = list(string)
    public_subnets       = list(string)
    enable_ipv6          = bool
    enable_nat_gateway   = bool
    enable_vpn_gateway   = bool
    enable_dns_hostnames = bool
    enable_dns_support   = bool
  })
}

variable "tags" {
  type = map(any)
}

# variable "db_subnet_group_name" {
#   description = "The name of the subnet group name (existing or created)"
#   type        = string
#   default     = ""
# }
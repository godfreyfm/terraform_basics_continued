variable "vpc_cidr_blocks" { 
  description = "This is the cidr block for the vpc"
  type = string
}

variable "env_prefix" {
  description = "This is the prefix for the environment being used"
  type = string
}
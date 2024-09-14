variable "subnet_cidr_block" {
  description = "This is the cidr block for the subnet"
  type = string
}
variable "avail_zone" {
  description = "Availability zone that is utilized"
  type = string
}
variable "env_prefix" {
  description = "This is the prefix for the environment being used"
  type = string
}
variable "all_IP" {
  description = "This is the 0.0.0.0/0 IP address that covers all"
  type = string
}

variable "vpc_id" {
  description = "This is the vpc id"
  type = string
}
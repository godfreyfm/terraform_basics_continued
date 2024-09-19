variable "region" {
  description = "The region where resources will be deployed"
  type = string
}
variable "vpc_cidr_blocks" { 
  description = "This is the cidr block for the vpc"
  type = string
}
variable "subnet_cidr_block" {
  description = "This is the cidr block for the subnet"
  type = list(string)
}
variable "avail_zone" {
  description = "Availability zone that is utilized"
  type = list(string)
}
variable "env_prefix" {
  description = "This is the prefix for the environment being used"
  type = string
}
variable "role_arn" {
  description = "This is the ARN that will be assumed by the user in the AWS account"
  type = string
}
variable "all_IP" {
  description = "This is the 0.0.0.0/0 IP address that covers all"
}
variable "my_ip" {
  description = "The IP for your location where eyou are running the lab from"
  type = string
  
}
variable "instance_type" {
  description = "The instance type"
  type = string
  
}
variable "my_public_key_location" {
  description = "This is the public IP from your local. created via ssh-keygen"
  type = string
  
}
variable "my_private_key_location" {
  description = "This is the private IP from your local, that pairs with the public"
  type = string
  
}

variable "associate_public_ip_address" {
  description = "Associate public IP or no"
  type = bool
}
variable "user_data_replace_on_change" {
  description = "replace user data on change or no"
  type = bool
}
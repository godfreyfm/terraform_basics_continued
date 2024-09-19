variable "instance_type" {
  description = "The instance type"
  type = string
  
}
variable "avail_zone" {
  description = "Availability zone that is utilized"
  type = list(string)
}
variable "env_prefix" {
  description = "This is the prefix for the environment being used"
  type = string
}
variable "my_ip" {
  description = "The IP for your location where eyou are running the lab from"
  type = string
  
}
variable "all_IP" {
  description = "This is the 0.0.0.0/0 IP address that covers all"
}
# variable "ami_id" {
  
# }
variable "my_public_key_location" {
  description = "This is the public IP from your local. created via ssh-keygen"
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

variable "subnet_id" {
  description = "The subnet ID to place this in"
  type = list(string)
}

variable "vpc_id" {
  description = "The vpc ID where this is targeted"
}

variable "ami_id" {
  description = "The ami that is used for the server"
}
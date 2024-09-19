
# Creates the vpc at a high level
module "myapp_vpc" {
  source = "./module/vpc"
  env_prefix = var.env_prefix
  vpc_cidr_blocks = var.vpc_cidr_blocks
}

# Creates the ami that you will use for the webserver
module "data_imports" {
  source = "./module/data_imports"
}

# Creates the subnet and its resources
module "myapp_subnet" {
  source = "./module/subnet"
  vpc_id = module.myapp_vpc.vpc_id
  avail_zone = var.avail_zone
  all_IP = var.all_IP
  env_prefix = var.env_prefix
  subnet_cidr_block = var.subnet_cidr_block
}

# Creates the webserver and all that goes along with it
module "myapp_webserver" {
  source = "./module/webserver"
  env_prefix = var.env_prefix
  avail_zone = var.avail_zone
  my_ip = var.my_ip
  all_IP = var.all_IP
  instance_type = var.instance_type
  my_public_key_location = var.my_public_key_location
  user_data_replace_on_change = var.user_data_replace_on_change
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id = module.myapp_subnet.myapp_subnet_ids
  vpc_id = module.myapp_vpc.vpc_id
  ami_id = module.data_imports.ami_id
}
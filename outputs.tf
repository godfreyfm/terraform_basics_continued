output "ami-data" {
  value = module.data_imports.ami_id
}
output "instace-pub-ip" {
  value = module.myapp_webserver.public_ip
}
output "myapp_subnet_id" {
  value = module.myapp_subnet.myapp_subnet_ids
}
output "myapp_igw_id" {
  value = module.myapp_subnet.myapp_igw_id
}
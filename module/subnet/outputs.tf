output "myapp_subnet_id" {
  value = aws_subnet.myapp-subnet-1.id
}

output "myapp_igw_id" {
  value = aws_internet_gateway.myapp-igw.id
}
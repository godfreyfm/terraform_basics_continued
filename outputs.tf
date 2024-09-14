output "ami-data" {
  value = data.aws_ami.myapp-ami.id
}
output "instace-pub-ip" {
  value = aws_instance.myapp-server.public_ip
}
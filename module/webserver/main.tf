

resource "aws_instance" "myapp-server" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.myapp-sg.id]
  availability_zone = var.avail_zone
  associate_public_ip_address = var.associate_public_ip_address
  key_name = aws_key_pair.ssh-key.key_name

  user_data = file("./scripts/entry-script.sh")
  user_data_replace_on_change = var.user_data_replace_on_change

  # connection {
  #   type = "ssh"
  #   host = self.public_ip
  #   user = "ubuntu"
  #   private_key = file(var.my_private_key_location)
  # }
  # provisioner "file" {
  #   source = "entry-script.sh"
  #   destination = "/home/ubuntu/entry-script.sh"
  # }
  # provisioner "remote-exec" {
  #   script = "entry-script.sh"
  # }

  tags = {
    Name: "${var.env_prefix}-server"
  }
}
resource "aws_security_group" "myapp-sg" {
  name = "myapp-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.my_ip]
  }
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = [var.all_IP]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.all_IP]
    prefix_list_ids = []

  }
  tags = {
    Name: "${var.env_prefix}-sg"
  }
}

resource "aws_key_pair" "ssh-key" {
  key_name = "server-key"
  public_key = file(var.my_public_key_location)
}


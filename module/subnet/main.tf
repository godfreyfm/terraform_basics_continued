resource "aws_subnet" "myapp-subnet-1" {
  count = length(var.subnet_cidr_block)
  vpc_id = var.vpc_id
  cidr_block = var.subnet_cidr_block[count.index]
  availability_zone = var.avail_zone[count.index]
  tags = {
    Name: "${var.env_prefix}-subnet-${count.index}"
  }
}

resource "aws_route_table" "myapp-route-table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.all_IP
    gateway_id = aws_internet_gateway.myapp-igw.id
  }

  tags = {
    Name: "${var.env_prefix}-rtb"
  }
}

resource "aws_internet_gateway" "myapp-igw" {
  vpc_id = var.vpc_id
  tags = {
    Name: "${var.env_prefix}-igw"
  }
}

resource "aws_route_table_association" "a-rtb-subnet" {
  count = length(var.subnet_cidr_block)
  subnet_id = aws_subnet.myapp-subnet-1[count.index].id
  route_table_id = aws_route_table.myapp-route-table.id
}
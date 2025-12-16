resource "aws_vpc" "name" {
  cidr_block = var.VPC_cidr_block
  tags = {
    Name = "${local.tags}-VPC"
  }
}


resource "aws_subnet" "subnet" {
  for_each = var.subnets

  vpc_id            = aws_vpc.name.id
  cidr_block        = each.value.cidr_block

  map_public_ip_on_launch = each.value.public

  tags = {
    Name   = each.key
    Type   = each.value.public ? "public" : "private"
  }
}


resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name = "${local.tags}-VPC-IGW"
  }
}

resource "aws_route_table" "name" {
  vpc_id = aws_vpc.name.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
  }
  tags = {
    Name = "${local.tags}-route-table"
  }
}

resource "aws_route_table_association" "public" {
  for_each = {
    for k, v in var.subnets : k => v
    if v.public == true
  }

  subnet_id      = aws_subnet.subnet[each.key].id
  route_table_id = aws_route_table.name.id
}

resource "aws_vpc" "vpc_network" {
  cidr_block = var.dev_infrastructure.vpc.cidr_block
  description = var.dev_infrastructure.vpc.description
  tags = {
    Name = var.dev_infrastructure.vpc.name
    env = var.dev_infrastructure.environment.name
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_network.id
  cdir_block = var.dev_infrastructure.vpc.cidr_block.private_subnet
  depends_on = [
    aws_subnet.public_subnet
  ]

  tags = {
    Name = "${var.dev_infrastructure.vpc.name}-private-subnet"
    env = var.dev_infrastructure.environment.name
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_network.id
  cdir_block = var.dev_infrastructure.vpc.cidr_block.public_subnet
  map_public_ip_on_launch = true

    tags = {
        Name = "${var.dev_infrastructure.vpc.name}-public-subnet"
        env = var.dev_infrastructure.environment.name
    }
}

resource "aws_network_interface" "public_network_interface" {
  subnet_id = aws_subnet.public_subnet.id
  description = "Network interface for EC2 instance"

  tags = {
    Name = "${var.dev_infrastructure.vpc.name}-network-interface"
    env = var.dev_infrastructure.environment.name
  }
}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.vpc_network.id
}

resource "aws_internet_gateway_attachment" "internet_gw_attachment" {
  vpc_id = aws_vpc.vpc_network.id
  internet_gateway_id = aws_internet_gateway.internet_gw.id
}
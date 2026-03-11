resource "aws_vpc" "vpc_network" {
  cidr_block = var.dev_infrastructure.vpc.cidr_block
  tags = {
    Name = var.dev_infrastructure.vpc.name
    env = var.dev_infrastructure.environment.name
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_network.id
  cidr_block = var.dev_infrastructure.vpc.subnet_cidr_block.private_subnet
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
  cidr_block = var.dev_infrastructure.vpc.subnet_cidr_block.public_subnet
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.dev_infrastructure.vpc.name}-public-subnet"
    env = var.dev_infrastructure.environment.name
  }
}

resource "aws_network_interface" "public_network_interface" {
  subnet_id = aws_subnet.public_subnet.id
  description = "Interfaz de red para la subred pública"

  tags = {
    Name = "${var.dev_infrastructure.vpc.name}-network-interface"
    env = var.dev_infrastructure.environment.name
  }
}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.vpc_network.id

  tags = {
    Name = "${var.dev_infrastructure.vpc.name}-internet-gateway"
    env = var.dev_infrastructure.environment.name
  }
}

# Crea una tabla de rutas dentro de la VPC.
# Una tabla de rutas define hacia dónde va el tráfico de red que sale de una subred.
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc_network.id

  route {
    cidr_block = "0.0.0.0/0" # Cualquier paquete que no tenga destino local, envía el tráfico a través del gateway de internet.
    gateway_id = aws_internet_gateway.internet_gw.id
  }

  tags = {
    Name = "${var.dev_infrastructure.vpc.name}-public-route-table"
    env = var.dev_infrastructure.environment.name
  }
}

# Vincula la tabla de rutas con una subred específica.
resource "aws_route_table_association" "public_route_table_association" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}
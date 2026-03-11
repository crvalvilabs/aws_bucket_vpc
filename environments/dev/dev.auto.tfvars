# Archivo de variables a utilizar en el despliegue de la infraestructura
dev_infrastructure = {
  "vpc" : {
    "name" : "dev-vpc",
    "cidr_block" : "10.10.0.0/16",
    "subnet_cidr_block" : {
        "public_subnet" : "10.10.0.0/24",
        "private_subnet" : "10.10.1.0/24"
    }
    "description" : "VPC para el entorno de desarrollo"
  },
  "bucket" : [
    {
      "name" : "landing-dev-bucket",
      "description" : "Bucket de aterrizaje para el entorno de desarrollo"
    },
    {
      "name" : "bronze-dev-bucket",
      "description" : "Bucket de bronce para el entorno de desarrollo"
    },
    {
      "name" : "silver-dev-bucket",
      "description" : "Bucket de plata para el entorno de desarrollo"
    },
    {
      "name" : "gold-dev-bucket",
      "description" : "Bucket de oro para el entorno de desarrollo"
    }
  ],
  "os" : {
    "name" : "ubuntu-jammy-22.04-amd64-server",
    "ami_id" : "ami-12345678",
    "instance_type" : "t2.micro",
    "description" : "Sistema operativo para las instancias EC2"
  },
  "region_dev" : {
    "name" : "us-east-1",
    "description" : "Región para el entorno de desarrollo"
  },
  "environment" : {
    "name" : "dev"
  }
}
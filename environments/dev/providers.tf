# Configuración de los proveedores para el entorno de desarrollo
provider "aws"  {
    alias = "aws_dev"
    region = var.dev_infrastructure.region_dev
}

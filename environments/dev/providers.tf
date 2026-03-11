# Configuración de los proveedores para el entorno de desarrollo
provider "aws"  {
    region = var.dev_infrastructure.region_dev.name

    # Credenciales falsas requeridas por Terraform
    access_key = "test"
    secret_key = "test"

    # Omitir validaciones de AWS que fallarían en local
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true

    # Forzar el estilo de ruta (path-style) para S3, esencial para LocalStack
    s3_use_path_style           = true

    # Redirigir los servicios a LocalStack
    endpoints {
        s3  = "http://localhost:4566"
        ec2 = "http://localhost:4566"
        iam = "http://localhost:4566"
        sts = "http://localhost:4566"
    }
}

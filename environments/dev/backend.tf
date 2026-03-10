/*
Environment: Development
Backend: S3
Description: Configuración del backend de Terraform para el entorno de desarrollo,
utilizando un bucket de S3 para almacenar el estado de Terraform.
El bucket se encuentra en la región us-east-1 y tiene configuraciones de seguridad como cifrado y control de acceso privado.
*/
terraform {
    backend "s3" {
        bucket         = "valvilabs-data-dev"
        key            = "dev/terraform.tfstate"
        region         = "us-east-1"
        acl            = "private"
        encrypt        = true
    }
}
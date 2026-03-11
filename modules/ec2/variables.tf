variable "dev_infrastructure" {
    description = "Variable para el entorno de desarrollo"
    type = object({
        vpc = object({
            name = string
            cidr_block = string
            subnet_cidr_block = object({
                public_subnet = string
                private_subnet = string
            })
            description = string
        })
        bucket = list(object({
            name = string
            description = string
        }))
        os = object({
            name = string
            ami_id = string
            instance_type = string
            description = string
        })
        region_dev = object({
            name = string
            description = string
        })
        environment = object({
            name = string
        })
    })
}

# Los modulos no pueden referenciarse entre si, por lo que se debe pasar el id de la interfaz de red pública como variable al módulo de EC2
variable "public_network_interface_id" {
  description = "ID de la interfaz de red pública para la instancia EC2"
  type        = string
}
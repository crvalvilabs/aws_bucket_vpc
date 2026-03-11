# Variable para el entorno de desarrollo
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

# No se necesita declarar la variable public_network_interface_id ya que viene del módulo
# network y se pasa como argumento al módulo ec2 en el main.tf.
# Es decir: No necesitas variable en dev porque el valor no viene del exterior del proyecto, sino de otro módulo dentro del mismo entorno.
variable "dev_infrastructure" {
    description = "Variable para el entorno de desarrollo"
    type = map(object({
        vpc = object({
            name = string
            cidr_block = object({
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
    }))
}

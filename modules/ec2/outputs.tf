output "ec2_info" {
    description = "EC2 información de la instancia"
    value = {
        instance_id = aws_instance.ubuntu.id
        public_ip   = aws_instance.ubuntu.public_ip
    }
}

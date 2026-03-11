resource "aws_instance" "ubuntu" {
  ami = var.dev_infrastructure.os.ami_id
  instance_type = var.dev_infrastructure.os.instance_type

  primary_network_interface {
    network_interface_id = var.public_network_interface_id
  }

    tags = {
        Name = var.dev_infrastructure.os.name
        Environment = var.dev_infrastructure.environment.name
    }
}
module "datalake" {
  source = "../../modules/datalake"

  dev_infrastructure = var.dev_infrastructure
}

module "network" {
  source = "../../modules/network"

  dev_infrastructure = var.dev_infrastructure
}

/*
module "ec2" {
  source = "../../modules/ec2"
  public_network_interface_id = module.network.public_network_interface_id

  dev_infrastructure = var.dev_infrastructure
}
*/
module "datalake" {
  source = "../../modules/datalake"
}

module "network" {
  source = "../../modules/network"
}

module "ec2" {
  source = "../../modules/ec2"
  public_network_interface_id = module.network.public_network_interface_id
}
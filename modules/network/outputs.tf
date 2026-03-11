output "public_network_interface_id" {
  description = "ID de la interfaz de red pública para la instancia EC2"
  # El output debe exportar el ID de la network interface en sí, no el subnet_id.
  value       = aws_network_interface.public_network_interface.id
}
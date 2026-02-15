output "instance_public_ip" {
  description = "Instance's public IP"
  value = oci_core_instance.minecraft_server.public_ip
}

output "instance_state" {
  description = "Instance's current state"
  value = oci_core_instance.minecraft_server.state
}
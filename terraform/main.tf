terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
      version = "5.30.0"
    }
  }
}

provider "oci" {
  tenancy_ocid          = var.tenancy
  user_ocid             = var.user
  fingerprint           = var.fingerprint
  private_key_path      = var.key_file
  region                = var.region
}

resource "oci_core_vcn" "main_vcn" {
  compartment_id = var.tenancy
  display_name   = "minecraft_server_vcn"
  cidr_block = "10.0.0.0/16"
  dns_label = "minecraftserver"
}

resource "oci_core_internet_gateway" "main_igw" {
  compartment_id = var.tenancy
  display_name   = "minecraft_server_igw"
  vcn_id = oci_core_vcn.main_vcn.id
}

resource "oci_core_route_table" "main_route_table" {
  compartment_id = var.tenancy
  display_name   = "minecraft_server_route_table"
  vcn_id = oci_core_vcn.main_vcn.id

  route_rules {
    destination = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.main_igw.id
    destination_type = "CIDR_BLOCK"
  }
}

resource "oci_core_subnet" "public_subnet" {
  compartment_id = var.tenancy
  vcn_id = oci_core_vcn.main_vcn.id
  display_name   = "minecraft_server_public_subnet"
  cidr_block = "10.0.1.0/24"
  route_table_id = oci_core_route_table.main_route_table.id

  security_list_ids = [oci_core_vcn.main_vcn.default_security_list_id]
}


module "minecraft_server" {
  source = "./minecraft_server"
  tenancy = var.tenancy
  subnet_id = oci_core_subnet.public_subnet.id
  ssh_public_key = file("~/.ssh/id_ed25519.pub")
  instance_name = "software-minecraft-server"
}

output "server_ip" {
  value = module.minecraft_server.instance_public_ip
}
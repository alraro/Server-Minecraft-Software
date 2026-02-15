terraform {
  required_providers {
    oci = {
        source = "oracle/oci"
    }
  }
}

data "oci_identity_availability_domains" "ads" {
    compartment_id = var.tenancy
}

data "oci_core_images" "oracle_linux_arm" {
    compartment_id = var.tenancy
    operating_system = "Oracle Linux"
    operating_system_version = "9"
    shape = "VM.Standard.A1.Flex"
    sort_by = "TIMECREATED"
    sort_order = "DESC"
}

resource "oci_core_instance" "minecraft_server" {
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[var.availability_domain_number].name
    compartment_id      = var.tenancy 
    display_name        = "Software Minecraft Server"
    shape = "VM.Standard.A1.Flex"
    shape_config {
        ocpus = var.ocpus
        memory_in_gbs = var.memory_in_gbs
    }

    create_vnic_details {
      subnet_id = var.subnet_id
      display_name = "primary_vnic"
      assign_public_ip = true
      hostname_label = var.instance_name
    }

    source_details {
      source_type = "image"
      source_id = data.oci_core_images.oracle_linux_arm.images[0].id
    }

    metadata = {
      ssh_authorized_keys = var.ssh_public_key
    }

    agent_config {
      plugins_config {
        desired_state = "ENABLED"
        name = "Vulnerability Scanning"
      }
      plugins_config {
        desired_state = "ENABLED"
        name = "Compute Instance Monitoring"
      }
    }
}
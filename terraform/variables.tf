variable "fingerprint" {
  description = "Fingerprint of OCI API private key for Tenancy"
  type        = string
}

variable "key_file" {
  description = "Path to OCI API private key used for Tenancy"
  type        = string
}

variable "tenancy" {
  description = "Tenancy ID where to create resources for Tenancy"
  type        = string
}

variable "user" {
  description = "User ID that Terraform will use to create resources for Tenancy"
  type        = string
}

variable "region" {
  description = "OCI region where resources will be created for Tenancy"
  type        = string
}

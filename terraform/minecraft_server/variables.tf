variable "tenancy" {
  description = "OCID del compartimento donde se creará la instancia"
  type        = string
}

variable "subnet_id" {
  description = "OCID de la Subnet pública donde vivirá la instancia"
  type        = string
}

variable "ssh_public_key" {
  description = "Ruta o contenido de la clave pública SSH"
  type        = string
}

variable "instance_name" {
  description = "Nombre de la instancia"
  type        = string
  default     = "software-minecraft-server"
}

variable "ocpus" {
  description = "Número de OCPUs (Max 4 para Always Free)"
  type        = number
  default     = 4
}

variable "memory_in_gbs" {
  description = "GBs de RAM (Max 24 para Always Free)"
  type        = number
  default     = 24
}

variable "availability_domain_number" {
  description = "Indice del dominio de disponibilidad"
  type        = number
  default     = 0
}
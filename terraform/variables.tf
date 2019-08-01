variable "access_key" {
  default = "AKIAQ62YJ33TIY4IRY7Q"
}
variable "secret_key" {
  default = "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"
}
variable "cidr_vpc" {
  description = "CIDR Bloco da VPC"
  default = "192.168.0.0/16"
}
variable "cidr_subnet_1a" {
  description = "Subnet Zona A 1.0/24"
  default = "192.168.1.0/24"
}
variable "cidr_subnet_1b" {
  description = "Subnet Zona B 2.0/24"
  default = "192.168.2.0/24"
}
variable "availability_zone_1a" {
  description = "Zona de Disponibilidade da SubNet"
  default = "ca-central-1a"
}
variable "availability_zone_1b" {
  description = "Zona de Disponibilidade da SubNet"
  default = "ca-central-1b"
}


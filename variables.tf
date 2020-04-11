#   __      __        _       _     _           
#   \ \    / /       (_)     | |   | |          
#    \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
#     \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#      \  / (_| | |  | | (_| | |_) | |  __/\__ \
#       \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/
#                                             

# Expect both of these to be in 'terraform.tfvars' file.

variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "eu-west-2" # London
}
variable "availability_zone" {
  default = "eu-west-2a" # London
}

variable "namespace" {
  default = "rancher"
}

variable "cluster_name" {
  default = "rancher-k8s"
}

variable "domain" {
  default = "morsley.io"
}
variable "subdomain" {
  default = "rancher"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  default = "10.0.0.0/24"
}

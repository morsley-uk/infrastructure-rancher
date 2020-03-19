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

#variable "key_name" {
#  default = "morsley-io-rancher-k8s"
#}

variable "name" {
  default = "rancher"
}

variable "bucket_name" {
  default = "morsley-io"
}

#variable "kube_config_filename" {
#  default = "morsley-io-rancher-kube-config.yaml"
#}

#variable "instance_type" {
#  default = "t2.2xlarge" # 8 vCPUs, 32 GB RAM
#}

#variable "cluster_name" {
#  default = "morsley-io"
#}

# ToDo --> use throughout
#variable "hostname" {
#  default = "rancher.morsley.io"
#}

#variable "domain_name" {
#  default = "morsley.io"
#}
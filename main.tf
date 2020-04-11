#    _____                  _               
#   |  __ \                | |              
#   | |__) |__ _ _ __   ___| |__   ___ _ __ 
#   |  _  // _` | '_ \ / __| '_ \ / _ \ '__|
#   | | \ \ (_| | | | | (__| | | |  __/ |   
#   |_|  \_\__,_|_| |_|\___|_| |_|\___|_|   
#                                         

# Create a Kubernetes cluster for Rancher...
module "kubernetes-cluster" {

  #source  = "john-morsley/kubernetes-cluster/aws"
  #version = "0.0.1"

  source = "../terraform-aws-kubernetes-cluster"

  region = var.region

  cluster_name = var.cluster_name

  vpc_cidr_block = var.vpc_cidr_block

  public_subnet_cidr_block = var.public_subnet_cidr_block
  availability_zone        = var.availability_zone

  domain    = "morsley.io"
  subdomain = "concourse"

  folder = local.folder

}

# Install Rancher on the above Kubernetes cluster...
resource "null_resource" "install-rancher" {

  depends_on = [
    module.kubernetes-cluster
  ]

  # https://www.terraform.io/docs/provisioners/local-exec.html

  provisioner "local-exec" {
    command = "bash ${path.module}/scripts/install_rancher.sh"
    environment = {
      FOLDER    = "${path.cwd}/${local.folder}"
      NAMESPACE = var.namespace
      HOSTNAME  = "${var.subdomain}.${var.domain}"
    }
  }

}

# Is Rancher ready...?
resource "null_resource" "is-concourse-ready" {

  depends_on = [
    null_resource.install-rancher
  ]

  # https://www.terraform.io/docs/provisioners/local-exec.html

  provisioner "local-exec" {
    command = "bash ${path.module}/scripts/is_concourse_ready.sh"
    environment = {
      FOLDER    = "${path.cwd}/${local.folder}"
      NAMESPACE = var.namespace
    }
  }

}

# Configure Route53...
module "route53" {

  source = "../terraform-aws-kubernetes-cluster/modules/route53"

  domain    = var.domain
  subdomain = var.subdomain
  public_ip = module.kubernetes-cluster.public_ip

}
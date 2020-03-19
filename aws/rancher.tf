#    _____                  _               
#   |  __ \                | |              
#   | |__) |__ _ _ __   ___| |__   ___ _ __ 
#   |  _  // _` | '_ \ / __| '_ \ / _ \ '__|
#   | | \ \ (_| | | | | (__| | | |  __/ |   
#   |_|  \_\__,_|_| |_|\___|_| |_|\___|_|   
#                                         

# 1. Read our cluster YAML from S3

# https://www.terraform.io/docs/providers/aws/d/s3_bucket-object.html

data "aws_s3_bucket_object" "rancher-cluster-yaml" {
  
  bucket = var.bucket_name
  key = "/${var.name}/kube_config.yaml"
  
}

resource "local_file" "kube-config-yaml" {
  
  content = data.aws_s3_bucket_object.rancher-cluster-yaml.body
  filename = "${path.cwd}/rancher/kube_config.yaml"
  
}

data "aws_s3_bucket_object" "node-public-dns" {

  bucket = var.bucket_name
  key = "/${var.name}/node-public-dns.txt"

}

resource "local_file" "node-public-dns" {

  content = data.aws_s3_bucket_object.node-public-dns.body
  filename = "${path.cwd}/rancher/node-public-dns.txt"

}


//output "rancher-cluster-yaml-o" {
//  
//  value = data.aws_s3_bucket_object.rancher-cluster-yaml
//  
//}

//output "rancher-cluster-yaml" {
//
//  value = data.aws_s3_bucket_object.rancher-cluster-yaml.body
//
//}

//output "node-public-dns-o" {
//
//  value = data.aws_s3_bucket_object.node-public-dns
//
//}

//output "node-public-dns" {
//
//  value = data.aws_s3_bucket_object.node-public-dns.body
//
//}

//resource "null_resource" "install-rancher" {
//
//  depends_on = [
//    data.aws_s3_bucket_object.rancher-cluster-yaml
//  ]
//
//  connection {
//    type        = "ssh"
//    host        = aws_instance.k8s.public_ip
//    user        = "ubuntu"
//    private_key = join("", tls_private_key.node_key.*.private_key_pem)
//  }
//
//  # https://www.terraform.io/docs/provisioners/local-exec.html
//
//  provisioner "local-exec" {
//    command = "chmod +x scripts/install_rancher.sh && bash scripts/install_rancher.sh"
//  }
//
//}
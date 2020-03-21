     _____                _   __  __      _ 
    |  __ \              | | |  \/  |    | |
    | |__) |___  __ _  __| | | \  / | ___| |
    |  _  // _ \/ _` |/ _` | | |\/| |/ _ \ |
    | | \ \  __/ (_| | (_| | | |  | |  __/_|
    |_|  \_\___|\__,_|\__,_| |_|  |_|\___(_)
    
The purpose of this project is to install Rancher on a Kubernetes cluster. This
could have been hosted on any Cloud provider, but I have chosen AWS (Amazon Web
Services).

This is being achieved by using Terraform and Helm.

Useful links:

## AWS:

https://www.terraform.io/docs/providers/aws/index.html

## Rancher (official):

https://www.terraform.io/docs/providers/rancher/index.html 

## Installing Rancher with Helm

https://rancher.com/docs/rancher/v2.x/en/installation/k8s-install/

1. Add node(s) with Terraform via AWS provider.
2. Add cluster with Terraform via RKE provider.
3. Add Rancher to cluster with Terraform via Bash scripts (Null_Reference resource).

## Install Rancher on the Kubernetes cluster

1. Add Helm chart repository.
2. Create a Rancher namespace.
3. Install Cert-Manager (Let's Encrypt).
4. Install Rancher with Helm.

Troubleshooting:

https://rancher.com/docs/rancher/v2.x/en/installation/options/troubleshooting/
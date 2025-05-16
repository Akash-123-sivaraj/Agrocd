variable "project_name" {
  description = "Name of the project and base tag for resources"
  type        = string
  default     = "gitops-argocd"
}

variable "region" {
  description = "The cloud region to deploy infrastructure"
  type        = string
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "Kubernetes cluster name"
  type        = string
  default     = "gitops-cluster"
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
  default     = "gitops-node-group"
}

variable "node_instance_type" {
  description = "Instance type for Kubernetes worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "vpc_id" {
  description = "VPC ID for the EKS cluster"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

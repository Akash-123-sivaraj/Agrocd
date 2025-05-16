output "cluster_name" {
  description = "Name of the Kubernetes cluster"
  value       = var.cluster_name
}

output "region" {
  description = "AWS region where the cluster is deployed"
  value       = var.region
}

output "cluster_endpoint" {
  description = "Kubernetes cluster API server endpoint"
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_certificate_authority_data" {
  description = "Kubernetes cluster CA certificate (base64 encoded)"
  value       = aws_eks_cluster.this.certificate_authority[0].data
}

output "node_group_arn" {
  description = "ARN of the EKS node group"
  value       = aws_eks_node_group.this.arn
}

output "kubeconfig" {
  description = "Kubeconfig content to connect to the EKS cluster"
  value = <<EOT
apiVersion: v1
clusters:
- cluster:
    server: ${aws_eks_cluster.this.endpoint}
    certificate-authority-data: ${aws_eks_cluster.this.certificate_authority[0].data}
  name: ${var.cluster_name}
contexts:
- context:
    cluster: ${var.cluster_name}
    user: aws
  name: ${var.cluster_name}
current-context: ${var.cluster_name}
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      command: aws
      args:
        - "eks"
        - "get-token"
        - "--cluster-name"
        - "${var.cluster_name}"
        - "--region"
        - "${var.region}"
EOT
  sensitive = true
}

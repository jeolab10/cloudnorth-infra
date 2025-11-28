output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.cloudnorth.name
}

output "cluster_endpoint" {
  description = "EKS cluster API server endpoint"
  value       = aws_eks_cluster.cloudnorth.endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = aws_eks_cluster.cloudnorth.certificate_authority[0].data
}

output "node_group_name" {
  description = "EKS managed node group name"
  value       = aws_eks_node_group.cloudnorth_nodes.node_group_name
}
output "cluster_name" {
  value       = module.eks.cluster_name
  description = "Name of the EKS cluster"
}

output "cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "Endpoint for the EKS cluster"
}

output "cluster_certificate_authority" {
  value       = module.eks.cluster_certificate_authority_data
  description = "EKS Cluster certificate authority data"
}

output "vpc_id" {
  value       = aws_vpc.eks_vpc.id
  description = "ID of the VPC"
}

output "subnets" {
  value       = aws_subnet.eks_subnet[*].id
  description = "IDs of the subnets"
}
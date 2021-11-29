output "vpc_id" {
  value = aws_vpc.eks_vpc.id
}

output "private_subnet_1a" {
  value = aws_subnet.eks_subnet_private_1a.id
}

output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.id
}
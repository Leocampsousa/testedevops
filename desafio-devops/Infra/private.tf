resource "aws_subnet" "eks_subnet_private_1a" {

  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = format("%sa", var.region)

  tags = {
    Name = format("%s-subnet-private-1a", var.cluster_name)
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

}
resource "aws_subnet" "eks_subnet_public_1a" {

  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = format("%sa", var.region)
  map_public_ip_on_launch = true

  tags = {
    Name = format("%s-subnet-public-1a", var.cluster_name)
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}
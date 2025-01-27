module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = ">= 19.14.0" # Use the latest version available
  cluster_name    = "my-project-cluster"
  cluster_version = "1.27"
  vpc_id          = aws_vpc.eks_vpc.id
  subnet_ids      = aws_subnet.eks_subnet[*].id

  tags = {
    Environment = "Dev"
  }
}
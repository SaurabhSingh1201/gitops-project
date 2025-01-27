resource "aws_vpc" "eks_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "eks-vpc"
  }
}

resource "aws_subnet" "eks_subnet" {
  count             = 2
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.eks_vpc.cidr_block, 8, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "eks-subnet-${count.index}"
  }
}

data "aws_availability_zones" "available" {}


#This file creates a Virtual Private Cloud (VPC) and subnets, which are required for the EKS cluster.
#aws_vpc: Creates a VPC with a CIDR block of 10.0.0.0/16.
#aws_subnet: Creates 2 subnets inside the VPC.
#data "aws_availability_zones": Fetches available AWS zones to ensure subnets are distributed across zones.
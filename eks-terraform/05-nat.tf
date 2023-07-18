#Creacion del Elastic IP
resource "aws_eip" "eks_nat" {
  vpc = true

  tags = {
    Name = "eks_nat"
  }
}

resource "aws_nat_gateway" "eks_nat_gw" {
  allocation_id = aws_eip.eks_nat.id
  subnet_id     = aws_subnet.eks_public01.id

  tags = {
    Name = "eks_nat_gw"
  }

# To ensure proper ordering, it is recommended to add an explicit dependency on the Internet Gateway for the VPC.
  depends_on = [
    aws_internet_gateway.eks_igw
  ]
}

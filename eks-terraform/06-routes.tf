resource "aws_route_table" "private" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_nat_gw.id
  }

  tags = {
    Name = "eks_private_rt"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id

  }
  tags = {
    Name = "eks_public_rt"
  }
}

#Asociacion de las tablas de enrutamiento
resource "aws_route_table_association" "private_01" {
  subnet_id      = aws_subnet.eks_private01.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_02" {
  subnet_id      = aws_subnet.eks_private02.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_03" {
  subnet_id      = aws_subnet.eks_private03.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public_01" {
  subnet_id      = aws_subnet.eks_public01.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_02" {
  subnet_id      = aws_subnet.eks_public02.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_03" {
  subnet_id      = aws_subnet.eks_public03.id
  route_table_id = aws_route_table.public.id
}

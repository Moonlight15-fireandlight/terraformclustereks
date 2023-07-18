resource "aws_subnet" "eks_private01" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "172.16.0.0/20"
  availability_zone = "ca-central-1a" #"us-east-2a" 

  tags = {
    Name                              = "eks_private01"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/eks_cluster" = "shared" # se cambio de owned a shared
  }
}

resource "aws_subnet" "eks_private02" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "172.16.16.0/20"
  availability_zone = "ca-central-1b" #"us-east-2b"

  tags = {
    Name                              = "eks_private02"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/eks_cluster" = "shared"
  }
}

resource "aws_subnet" "eks_private03" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "172.16.32.0/20"
  availability_zone = "ca-central-1d" #"us-east-2c"

  tags = {
    Name                              = "eks_private03"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/eks_cluster" = "shared"
  }
}

resource "aws_subnet" "eks_public01" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "172.16.48.0/20"
  availability_zone       = "ca-central-1a"
  map_public_ip_on_launch = true #Asigna por default una ip publica a las instancias creadas dentro de esta subnet

  tags = {
    Name                         = "eks_public01"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/eks_cluster" = "shared"
  }
}

resource "aws_subnet" "eks_public02" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "172.16.64.0/20"
  availability_zone       = "ca-central-1b"
  map_public_ip_on_launch = true

  tags = {
    Name                         = "eks_public02"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/eks_cluster" = "shared"
  }
}

resource "aws_subnet" "eks_public03" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "172.16.80.0/20"
  availability_zone       = "ca-central-1d"
  map_public_ip_on_launch = true

  tags = {
    Name                         = "eks_public03"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/eks_cluster" = "shared"
  }
}

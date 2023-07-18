resource "aws_vpc" "eks_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "eks_ingresslink_vpc"
  }
}

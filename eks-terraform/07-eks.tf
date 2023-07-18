#Crea un rol para para el cluster eks creado
resource "aws_iam_role" "eks_role" {
  name = "eks_ingress_test_role_106" #"eks_ingresslink_role_01"

  assume_role_policy = <<POLICY
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "eks.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        ]
    }
    POLICY
}

resource "aws_iam_role_policy_attachment" "eks_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_role.name
}
# Creando el cluster con el rol creado
resource "aws_eks_cluster" "eks" {
  name     = "eks_cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.eks_private01.id,
      aws_subnet.eks_private02.id,
      aws_subnet.eks_private03.id,
      aws_subnet.eks_public01.id,
      aws_subnet.eks_public02.id,
      aws_subnet.eks_public03.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_AmazonEKSClusterPolicy
  ]
}

# Creating Internet Gateway
# internet gateway


resource "aws_internet_gateway" "IntGwy" {
  vpc_id = aws_vpc.vpc-3T.id

  tags = {
    Name = "IntGwy"
  }
}


# Elastic Ip
resource "aws_eip" "nat_eip" {
  vpc                       = true
  associate_with_private_ip = var.priv-sub1
  depends_on                = [aws_internet_gateway.IntGwy]
  tags = {
    Name = "nat_eip"
  }
}


# Nat Gateway

resource "aws_nat_gateway" "Nat-gatwy" {
  allocation_id = aws_eip.nat_eip.id

  #Associate it with one of the public subnets
  subnet_id = aws_subnet.pub-sub1.id
  # subnet_id      = aws_subnet.pub-sub2.id

  tags = {
    Name = "Nat-gatwy"
  }
}





#resource "aws_eip" "nat_gateway" {
#  vpc = true
#}
#
#resource "aws_nat_gateway" "nat_gateway" {
#  allocation_id = aws_eip.nat_gateway.id
#  subnet_id = aws_subnet.nat_gateway.id
#  tags = {
#    "Name" = "DummyNatGateway"
#  }
#}
#
#output "nat_gateway_ip" {
#  value = aws_eip.nat_gateway.public_ip
#}

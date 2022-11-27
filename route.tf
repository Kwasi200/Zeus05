# Creating public Route Table
resource "aws_route_table" "pub-route-table" {
  vpc_id = aws_vpc.vpc-3T.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IntGwy.id
  }
  tags = {
    Name = "Route to internet"
  }
}


# Creating a Route Table for the Nat Gateway!
resource "aws_route_table" "priv-route-table" {
  depends_on = [aws_nat_gateway.Nat-gatwy]

  vpc_id = aws_vpc.vpc-3T.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.Nat-gatwy.id
  }

  tags = {
    Name = "Route Table for NAT Gateway"
  }

}


resource "aws_route_table_association" "public_route_table_association_1" {
  subnet_id      = aws_subnet.pub-sub1.id
  route_table_id = aws_route_table.pub-route-table.id
}

resource "aws_route_table_association" "public_route_table_association_2" {
  subnet_id      = aws_subnet.pub-sub2.id
  route_table_id = aws_route_table.pub-route-table.id
}

resource "aws_route_table_association" "public_route_table_association_3" {
  subnet_id      = aws_subnet.pub-sub3.id
  route_table_id = aws_route_table.pub-route-table.id
}


resource "aws_route_table_association" "private_route_table_association_1" {
  subnet_id      = aws_subnet.priv-sub1.id
  route_table_id = aws_route_table.priv-route-table.id
}

resource "aws_route_table_association" "private_route_table_association_2" {
  subnet_id      = aws_subnet.priv-sub2.id
  route_table_id = aws_route_table.priv-route-table.id
}

resource "aws_route_table_association" "private_route_table_association_3" {
  subnet_id      = aws_subnet.priv-sub3.id
  route_table_id = aws_route_table.priv-route-table.id
}


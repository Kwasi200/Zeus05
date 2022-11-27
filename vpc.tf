



resource "aws_vpc" "vpc-3T" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "vpc-3T"
  }
}



resource "aws_subnet" "pub-sub1" {
  vpc_id            = aws_vpc.vpc-3T.id
  cidr_block        = var.pub-sub1
  availability_zone = var.AZ-1

  tags = {
    Name = "pub-sub1"
  }
}

# Public subnet2
resource "aws_subnet" "pub-sub2" {
  vpc_id            = aws_vpc.vpc-3T.id
  cidr_block        = var.pub-sub2
  availability_zone = var.AZ-2

  tags = {
    Name = "pub-sub2"
  }
}
# Public subnet3
resource "aws_subnet" "pub-sub3" {

  vpc_id            = aws_vpc.vpc-3T.id
  cidr_block        = var.pub-sub3
  availability_zone = var.AZ-3

  tags = {
    Name = "pub-sub3"
  }
}

# Private subnet1
resource "aws_subnet" "priv-sub1" {
  vpc_id            = aws_vpc.vpc-3T.id
  cidr_block        = var.priv-sub1
  availability_zone = var.AZ-1

  tags = {
    Name = "priv-sub1"
  }
}

# Private subnet2
resource "aws_subnet" "priv-sub2" {
  vpc_id            = aws_vpc.vpc-3T.id
  cidr_block        = var.priv-sub2
  availability_zone = var.AZ-2
  tags = {
    Name = "priv-sub2"
  }
}

# Private subnet3
resource "aws_subnet" "priv-sub3" {
  vpc_id            = aws_vpc.vpc-3T.id
  cidr_block        = var.priv-sub3
  availability_zone = var.AZ-3

  tags = {
    Name = "priv-sub3"
  }
}




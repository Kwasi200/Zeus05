# Creating Security Group



resource "aws_security_group" "freebird-sg" {
  name        = "freebird-sg"
  description = "security group to allow everything"
  vpc_id      = aws_vpc.vpc-3T.id

  ingress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}

resource "aws_security_group" "front-end" {
  name        = "front-end-sg"
  description = "security group for front end instances"
  vpc_id      = aws_vpc.vpc-3T.id

  ingress {
    description     = " from VPC"
    from_port       = 80
    to_port         = 80
    protocol        = "TCP"
    security_groups = [aws_security_group.freebird-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "backend-sg" {
  name        = "backend-sg"
  description = "security group for RDS"
  vpc_id      = aws_vpc.vpc-3T.id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = -1
    #security_groups = [aws_security_group.vprofile-prod-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group_rule" "sec_group_allow_itself" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.backend-sg.id
  source_security_group_id = aws_security_group.backend-sg.id
}

#### copied up to this point


resource "aws_security_group" "sec-gp" {
  name        = "allow http"
  description = "allow http for inbound traffic"
  vpc_id      = aws_vpc.vpc-3T.id

  ingress {
    description = "http from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

}

# HTTPS access from anywhere


# Create Database Security Group

resource "aws_db_instance" "db-tier" {
  allocated_storage      = 10
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.dbname
  username               = var.username
  password               = var.dbpass
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = true
  publicly_accessible    = "false"
  multi_az               = "false"
  db_subnet_group_name   = aws_db_subnet_group.rds-subgp.name
  vpc_security_group_ids = [aws_security_group.freebird-sg.id]
}



# database subnet group

resource "aws_db_subnet_group" "rds-subgp" {
  subnet_ids = [aws_subnet.priv-sub1.id, aws_subnet.priv-sub2.id, aws_subnet.priv-sub3.id]

  tags = {
    Name = "subnet group for RDS"
  }
}


#### security group for database tier

resource "aws_security_group" "db-sg" {
  name        = "database-sg"
  description = "security group for RDS"
  vpc_id      = aws_vpc.vpc-3T.id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = -1
    security_groups = [aws_security_group.front-end.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
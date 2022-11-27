resource "aws_instance" "backend" {
  ami                         = var.amazon_ubuntu
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.priv-sub2.id
  vpc_security_group_ids      = [aws_security_group.freebird-sg.id]
  associate_public_ip_address = false
  availability_zone           = var.AZ-2
  user_data                   = file("install_apache.sh")

  tags = {
    "Name" : "backend"
  }

}


############################
/* resource "aws_instance" "jenkins" {
  ami                         = var.amazon_ubuntu
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.pub-sub1.id
  vpc_security_group_ids      = [aws_security_group.freebird-sg.id]
  associate_public_ip_address = true
  availability_zone           = var.AZ-1
  user_data                   = file("install_jenkins.sh")

  tags = {
    "Name" : "Jenkins"
  }

} */

#tags = {
#  "Name" : "web-server-1"
#}
#}
######################################

# resource "aws_instance" "web-server-2" {
# ami           = var.amazon_ubuntu
# instance_type = var.instance_type
# key_name      = var.key_name

# subnet_id                   = aws_subnet.pub-sub3.id
# vpc_security_group_ids      = [aws_security_group.free-bird.id]
# associate_public_ip_address = true
# availability_zone           = var.AZ-2
# user_data                   = file("install_apache.sh")



#tags = {
#    "Name" : "web-server-2"
#  }
#}
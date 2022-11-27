output "vpc_id" {
  value = var.vpc_name
}
output "vpc-name" {
  value = var.vpc_name

}

output "vpc_pub_subne_1" {
  description = "IDs of the VPC's public subnet-1"
  value       = var.pub-sub1
}


output "vpc_public_subnet_2" {
  description = "IDs of the VPC's public subnet-2"
  value       = var.pub-sub2
}

output "vpc_private_subnet_1" {
  description = "IDs of the VPC's private subnet_1"
  value       = var.priv-sub1

}

output "vpc_private_subnet_2" {
  description = "IDs of the VPC's private subnet_2"
  value       = var.priv-sub2

}

output "Elastic_ip" {
  description = "Elastic Ip"
  value       = aws_eip.nat_eip
}

output "freebird-security-group" {
  value = aws_security_group.freebird-sg.id
}




/* output "Test-server1-public-ip" {
  description = "Public IP address of the EC2 instance_1"
  value       = aws_instance.Test-server1
}

output "Test-server2-public-ip" {
  value = ["${aws_instance.Test-server2.*.public_ip}"]
}

output "Bastion-public-ip" {
  value = ["${aws_instance.Bastion.*.public_ip}"]
}


 */

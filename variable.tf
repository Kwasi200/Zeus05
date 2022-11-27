#
variable "region_name" {
  description = "name of region"
  default     = "eu-west-2"
}

variable "vpc_name" {
  default = "vpc-3T"
}

variable "cidr_block" {
  description = "Cidr block for vpc"
  default     = "10.0.0.0/16"
}


variable "pub-sub1" {
  description = "public subnet_1"
  default     = "10.0.1.0/24"
  type        = string
}

variable "pub-sub2" {
  description = "public subnet_2"
  default     = "10.0.2.0/24"
  type        = string
}
variable "pub-sub3" {
  description = "public subnet_2"
  default     = "10.0.3.0/24"
  type        = string
}


variable "priv-sub1" {
  description = "private_subnet_1"
  default     = "10.0.4.0/24"
  type        = string
}

variable "priv-sub2" {
  description = "private_subnet_2"
  default     = "10.0.5.0/24"
}

variable "priv-sub3" {
  description = "private_subnet_3"
  default     = "10.0.6.0/24"
}


variable "AZ-1" {
  description = "availability Zone"
  default     = "eu-west-2a"
}

variable "AZ-2" {
  description = "availability Zone"
  default     = "eu-west-2b"
}

variable "AZ-3" {
  description = "availability Zone"
  default     = "eu-west-2c"
}
variable "destination_cidr_block" {
  description = "destination cidr block"
  default     = "0.0.0.0/0"
  type        = string
}


variable "amazon_linux" {
  description = "amazon machine image"
  default     = "ami-00785f4835c6acf64"
  type        = string
}

variable "amazon_ubuntu" {
  description = "amazon machine image"
  default     = "ami-05a8c865b4de3b127"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name"
  default     = "demon"
}

# database variables

variable "instance_class" {
  description = "db instance"
  default     = "db.t3.micro"
  type        = string
}


variable "engine" {
  description = "database engine type"
  default     = "mysql"
  type        = string
}

variable "engine_version" {
  description = "db engine version"
  default     = "5.7"
  type        = string
}

variable "allocated_storage" {
  description = "db physical storage"
  default     = 10
  type        = number
}

variable "parameter_group_name" {
  description = "parameter group name"
  default     = "default.mysql5.7"
  type        = string
}



variable "username" {
  default = "ubuntu"
}

variable "rmquser" {
  default = "rabbit"
}

variable "rmqpass" {
  default = "whatthefuckareyousaying?"
}

variable "dbpass" {
  default = "heytherewegoagain"
}

variable "dbname" {
  default = "admin"
}

variable "AMIS" {
  type = map(any)
  default = {
    eu-west-2 = "ami -0f1f4b28f318ccd97"
    eu-west-2 = "ami-08a36276cbbd093da"
    eu-west-2 = "ami-07cf622713ac7fbbb"
  }
}




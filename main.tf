provider "aws" {
  region = "us-east-1" # Change to your desired region
}

resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "MainVPC"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a" # Change as per your desired AZ
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet1_public"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b" # Change as per your desired AZ
  map_public_ip_on_launch = false
  tags = {
    Name = "Subnet2_private"
  }
}

output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnet_1_id" {
  value = aws_subnet.subnet_1.id
}

output "subnet_2_id" {
  value = aws_subnet.subnet_2.id
}


// Creating a VPC
resource "aws_vpc" "terraformTest" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

  tags = {
    "Name" = "terraformTest"
  }
}

// Creating a Public Subnet
resource "aws_subnet" "public1" {
  cidr_block              = "10.10.1.0/24"
  vpc_id                  = aws_vpc.terraformTest.id
  availability_zone       = var.aws_region_az_list[0]
  map_public_ip_on_launch = true

  tags = {
    "Name" = "terraformPublicSubnet"
  }
}

// Creating a Private Subnet
resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.terraformTest.id
  cidr_block        = "10.10.2.0/24"
  availability_zone = var.aws_region_az_list[1]

  tags = {
    "Name" = "terraformPrivateSubnet"
  }
}

// Creating a Security Group
resource "aws_security_group" "sg" {
  name        = "terraform-sg"
  description = "Security group for EC2"
  vpc_id      = aws_vpc.terraformTest.id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }
  tags = {
    "Name" = "Terraform-EC2-SG"
  }
}
variable "aws_access_key" {
  description = "The AWS access key"
  type        = string
}

variable "aws_secret_access_key" {
  description = "The AWS secret access key"
  type        = string
}

variable "aws_region" {
  description = "AWS region used"
  type        = string
}

variable "aws_region_az_list" {
  description = "AZs in the region"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

/*
variable "aws_ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "aws_ec2_ami_id" {
  type        = map(string)
  description = "A map of AMIs"
}

variable "aws_ec2_key_pair" {
  type        = string
  description = "The EC2 key pair to be used"
}
*/
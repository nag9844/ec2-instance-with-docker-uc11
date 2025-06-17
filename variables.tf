variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "Name of the SSH key pair to use for EC2 instances"
  type        = string
  default     = "demo-key"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-0f918f7e67a3323f0" 


variable "security_group" {
  description = "security group id"
  type        = list(string)
  default     = ["sg-042c3bb8f3b9be6b6"]
}
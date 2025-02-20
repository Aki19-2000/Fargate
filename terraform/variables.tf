# variables.tf - Global variables for the root module

# AWS region
variable "aws_region" {
  description = "AWS region to deploy resources in"
  default     = "us-east-1"
}

# VPC Configuration
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for the first public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for the first private subnet"
  default     = "10.0.2.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for the second public subnet"
  default     = "10.0.3.0/24"
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for the second private subnet"
  default     = "10.0.4.0/24"
}

variable "az_1" {
  description = "Availability Zone 1"
  default     = "us-east-1a"
}

variable "az_2" {
  description = "Availability Zone 2"
  default     = "us-east-1b"
}

# ECS Configuration
variable "ecs_cluster_name" {
  description = "Name of the ECS Cluster"
  default     = "my-cluster"
}

variable "ecs_task_family" {
  description = "ECS Task Definition Family"
  default     = "my-task-family"
}

variable "patient_service_image" {
  description = "Docker image URL for the patient service"
  default     = "<aws_account_id>.dkr.ecr.<region>.amazonaws.com/patient-service:latest"
}

variable "security_group_id" {
  description = "The security group ID for ECS service"
  default     = "sg-12345"
}

variable "alb_name" {
  description = "The name of the Application Load Balancer"
  default     = "my-alb"
}

variable "lb_security_groups" {
  description = "The security groups for the load balancer"
  type        = list(string)
  default     = ["sg-12345"]
}

variable "lb_subnets" {
  description = "The subnets where the load balancer will be deployed"
  type        = list(string)
  default     = []
}


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
  default     = "dev-cluster"
}

variable "ecs_task_family" {
  description = "ECS Task Definition Family"
  default     = "dev-task-family"
}

variable "patient_service_image" {
  description = "Docker image URL for the patient service"
  default     = "<aws_account_id>.dkr.ecr.<region>.amazonaws.com/patient-service:latest"
}

variable "appointment_service_image" {
  description = "Docker image URL for the appointment service"
  default     = "<aws_account_id>.dkr.ecr.<region>.amazonaws.com/appointment-service:latest"
}

# ALB Configuration
variable "alb_name" {
  description = "The name of the Application Load Balancer"
  default     = "dev-alb"
}

variable "lb_security_groups" {
  description = "The security groups to associate with the ALB"
  type        = list(string)
}

variable "lb_subnets" {
  description = "The subnets to associate with the ALB"
  type        = list(string)
}

# VPC ID (if needed for the ALB configuration)
variable "vpc_id" {
  description = "The VPC ID where the ALB and target groups will be created"
  type        = string
}

# Subnet ID and Security Group ID for ECS services (needed for networking)
variable "subnet_id" {
  description = "Subnet ID for ECS services"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID for ECS services"
  type        = string
}

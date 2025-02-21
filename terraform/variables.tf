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

# Subnets and Availability Zones
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
  default     = "510278866235.dkr.ecr.us-east-1.amazonaws.com/patient-service:latest"
}

variable "appointment_service_image" {
  description = "Docker image URL for the appointment service"
  default     = "510278866235.dkr.ecr.us-east-1.amazonaws.com/appointment-service:latest"
}

# ALB Configuration
variable "alb_name" {
  description = "The name of the Application Load Balancer"
  default     = "dev-alb"
}

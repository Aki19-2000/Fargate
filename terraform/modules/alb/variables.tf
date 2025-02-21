# modules/alb/variables.tf

variable "alb_name" {
  description = "The name of the ALB"
  type        = string
}

variable "lb_security_groups" {
  description = "The security groups for the ALB"
  type        = list(string)
}

variable "lb_subnets" {
  description = "The subnets for the ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

# Removed the variables for patient_service_id and appointment_service_id

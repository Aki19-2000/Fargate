variable "alb_name" {
  description = "The name of the Application Load Balancer"
  type        = string
}

variable "lb_security_groups" {
  description = "The security groups to associate with the ALB"
  type        = list(string)
}

variable "lb_subnets" {
  description = "The subnets to associate with the ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID where the ALB and target groups will be created"
  type        = string
}

variable "patient_service_id" {
  description = "The ECS service ID for patient service"
  type        = string
}

variable "appointment_service_id" {
  description = "The ECS service ID for appointment service"
  type        = string
}

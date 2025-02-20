variable "alb_name" {
  description = "The name of the Application Load Balancer"
  type        = string
}

variable "lb_security_groups" {
  description = "The security groups associated with the load balancer"
  type        = list(string)
}

variable "lb_subnets" {
  description = "The subnets where the load balancer will be deployed"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID for the load balancer"
  type        = string
}


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



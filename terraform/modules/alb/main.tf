# Accept ECS service IP addresses as input variables in the ALB module
variable "patient_service_id" {
  description = "The ECS patient service IP"
  type        = string
}

variable "appointment_service_id" {
  description = "The ECS appointment service IP"
  type        = string
}

# Define the ALB
resource "aws_lb" "app_lb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.lb_security_groups
  subnets            = var.lb_subnets
}

# Define Target Groups with IP as the target type
resource "aws_lb_target_group" "patient_tg" {
  name        = "patient-service-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"  # Set target_type to IP
}

resource "aws_lb_target_group" "appointment_tg" {
  name        = "appointment-service-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"  # Set target_type to IP
}

# Attach ECS services to the target groups using IPs
resource "aws_lb_target_group_attachment" "patient_service_attachment" {
  target_group_arn = aws_lb_target_group.patient_tg.arn
  target_id        = aws_ecs_task.patient_service_task.network_interface[0].private_ip  # Correct reference for task's private IP
  port             = 80
}

resource "aws_lb_target_group_attachment" "appointment_service_attachment" {
  target_group_arn = aws_lb_target_group.appointment_tg.arn
  target_id        = aws_ecs_task.appointment_service_task.network_interface[0].private_ip  # Correct reference for task's private IP
  port             = 80
}


# ALB Listener for HTTP traffic
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      status_code   = 200
      message_body  = "Welcome to the Application Load Balancer!"
      content_type  = "text/plain"
    }
  }
}

# Add listener rule to forward traffic to Patient Service
resource "aws_lb_listener_rule" "patient_service_rule" {
  listener_arn = aws_lb_listener.http_listener.arn
  priority     = 1
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.patient_tg.arn
  }
  condition {
    path_pattern { 
      values = ["/patient"]
    } 
  }
}

# Add listener rule to forward traffic to Appointment Service
resource "aws_lb_listener_rule" "appointment_service_rule" {
  listener_arn = aws_lb_listener.http_listener.arn
  priority     = 2
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.appointment_tg.arn
  }
  condition {
    path_pattern { 
      values = ["/appointment"]
    }
  }
}

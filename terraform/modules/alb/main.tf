# ALB Load Balancer
resource "aws_lb" "app_lb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.lb_security_groups
  subnets            = var.lb_subnets
}

# Patient Service Target Group
resource "aws_lb_target_group" "patient_tg" {
  name     = "patient-service-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"  # Target type set to IP (Fargate tasks)

  health_check {
    path                = "/health"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }
}

# Appointment Service Target Group
resource "aws_lb_target_group" "appointment_tg" {
  name     = "appointment-service-tg"
  port     = 3001
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"  # Target type set to IP (Fargate tasks)

  health_check {
    path                = "/health"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }
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
      values = ["/patients"]
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
      values = ["/appointments"]
    }
  }
}


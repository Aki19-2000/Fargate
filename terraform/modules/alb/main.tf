resource "aws_lb" "app_lb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.lb_security_groups
  subnets            = var.lb_subnets
}

# Target Group for Patient Service
resource "aws_lb_target_group" "patient_tg" {
  name     = "patient-service-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

# Target Group for Appointment Service
resource "aws_lb_target_group" "appointment_tg" {
  name     = "appointment-service-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

# ALB Listener for HTTP traffic
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      status_code = 200
      message_body = "Welcome to the Application Load Balancer!"
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
    field  = "path-pattern"
    values = ["/patient*"] # Route traffic to patient service if path starts with /patient
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
    field  = "path-pattern"
    values = ["/appointment*"] # Route traffic to appointment service if path starts with /appointment
  }
}

# Register ECS Services with respective Target Groups
resource "aws_lb_target_group_attachment" "patient_service_attachment" {
  target_group_arn = aws_lb_target_group.patient_tg.arn
  target_id        = aws_ecs_service.patient_service.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "appointment_service_attachment" {
  target_group_arn = aws_lb_target_group.appointment_tg.arn
  target_id        = aws_ecs_service.appointment_service.id
  port             = 80
}

resource "aws_lb" "app_lb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups   = var.lb_security_groups
  subnets           = var.lb_subnets
}

resource "aws_lb_target_group" "patient_tg" {
  name     = "patient-service-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.patient_tg.arn
  }
}


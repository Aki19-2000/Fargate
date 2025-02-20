output "alb_dns_name" {
  value = aws_lb.app_lb.dns_name
}

output "patient_target_group_arn" {
  value = aws_lb_target_group.patient_tg.arn
}


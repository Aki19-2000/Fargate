output "alb_id" {
  description = "The ID of the application load balancer"
  value       = aws_lb.app_lb.id
}

output "alb_dns_name" {
  description = "The DNS name of the application load balancer"
  value       = aws_lb.app_lb.dns_name
}

output "patient_tg_arn" {
  description = "The ARN of the patient service target group"
  value       = aws_lb_target_group.patient_tg.arn
}

output "appointment_tg_arn" {
  description = "The ARN of the appointment service target group"
  value       = aws_lb_target_group.appointment_tg.arn
}

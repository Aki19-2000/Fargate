# outputs.tf - Global outputs for Terraform

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  value       = module.ecs.ecs_cluster_name
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = module.alb.alb_dns_name
}

output "patient_service_repo_url" {
  description = "The repository URL for the patient service"
  value       = module.ecr.patient_service_repo_url
}

# dev.tfvars - Environment-specific variables for dev

# VPC and Subnets (other required values)
vpc_cidr                = "10.0.0.0/16"
public_subnet_1_cidr    = "10.0.1.0/24"
private_subnet_1_cidr   = "10.0.2.0/24"
public_subnet_2_cidr    = "10.0.3.0/24"
private_subnet_2_cidr   = "10.0.4.0/24"
az_1                     = "us-east-1a"
az_2                     = "us-east-1b"

# ECS Configuration
ecs_cluster_name         = "dev-cluster"
ecs_task_family          = "dev-task-family"
patient_service_image    = "510278866235.dkr.ecr.us-east-1.amazonaws.com/patient-service:latest"
appointment_service_image = "510278866235.dkr.ecr.us-east-1.amazonaws.com/appointment-service:latest"

# ALB Configuration
alb_name                 = "dev-alb"

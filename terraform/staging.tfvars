# staging.tfvars - Environment-specific variables for staging

vpc_cidr                = "10.2.0.0/16"
public_subnet_1_cidr    = "10.2.1.0/24"
private_subnet_1_cidr   = "10.2.2.0/24"
public_subnet_2_cidr    = "10.2.3.0/24"
private_subnet_2_cidr   = "10.2.4.0/24"
az_1                     = "us-east-1a"
az_2                     = "us-east-1b"
ecs_cluster_name         = "staging-cluster"
ecs_task_family          = "staging-task-family"
patient_service_image    = "510278866235.dkr.ecr.us-east-1.amazonaws.com/patient-service:latest"
alb_name                 = "staging-alb"

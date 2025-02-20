# dev.tfvars - Environment-specific variables for dev

vpc_cidr                = "10.0.0.0/16"
public_subnet_1_cidr    = "10.0.1.0/24"
private_subnet_1_cidr   = "10.0.2.0/24"
public_subnet_2_cidr    = "10.0.3.0/24"
private_subnet_2_cidr   = "10.0.4.0/24"
az_1                     = "us-east-1a"
az_2                     = "us-east-1b"
ecs_cluster_name         = "dev-cluster"
ecs_task_family          = "dev-task-family"
patient_service_image    = "<aws_account_id>.dkr.ecr.<region>.amazonaws.com/patient-service:dev"
security_group_id        = "sg-xyz-dev"
alb_name                 = "dev-alb"
lb_security_groups       = ["sg-xyz-dev"]
lb_subnets               = ["subnet-xyz1", "subnet-xyz2"]


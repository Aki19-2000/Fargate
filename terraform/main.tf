# Create the Security Groups first, so they are available for ALB and ECS
resource "aws_security_group" "ecs_sg" {
  name        = "ecs_security_group"
  description = "Allow inbound traffic to ECS services"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "lb_sg" {
  name        = "lb_security_group"
  description = "Allow inbound traffic to the ALB"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  vpc_name             = "my-vpc"
  public_subnet_1_cidr = var.public_subnet_1_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
  az_1                 = var.az_1
  az_2                 = var.az_2
}

module "ecs" {
  source                = "./modules/ecs"
  ecs_cluster_name      = var.ecs_cluster_name
  ecs_task_family       = var.ecs_task_family
  ecs_execution_role_arn = module.vpc.ecs_execution_role_arn
  ecs_task_role_arn     = module.vpc.ecs_task_role_arn
  patient_service_image = var.patient_service_image
  appointment_service_image = var.appointment_service_image
  subnet_id            = module.vpc.public_subnet_1_id
  security_group_id    = aws_security_group.ecs_sg.id
}

module "ecr" {
  source                       = "./modules/ecr"
  patient_service_repo_name    = "patient-service"
  appointment_service_repo_name = "appointment-service"
}

# Remove patient_service_id and appointment_service_id arguments from ALB module
module "alb" {
  source                     = "./modules/alb"
  alb_name                   = var.alb_name
  lb_security_groups         = [aws_security_group.lb_sg.id]
  lb_subnets                 = [module.vpc.public_subnet_1_id, module.vpc.public_subnet_2_id]
  vpc_id                     = module.vpc.vpc_id
  patient_service_ip         = module.ecs.patient_service_ip  # Pass ECS patient service IP from the ECS module
  appointment_service_ip     = module.ecs.appointment_service_ip  # Pass ECS appointment service IP from the ECS module
}

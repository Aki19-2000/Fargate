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

  # Pass the target group ARNs from ALB module
  patient_tg_arn       = module.alb.patient_tg.arn
  appointment_tg_arn   = module.alb.appointment_tg.arn
}

module "alb" {
  source                     = "./modules/alb"
  alb_name                   = var.alb_name
  lb_security_groups         = [aws_security_group.lb_sg.id]
  lb_subnets                 = [module.vpc.public_subnet_1_id, module.vpc.public_subnet_2_id]
  vpc_id                     = module.vpc.vpc_id
}

module "ecr" {
  source                       = "./modules/ecr"
  patient_service_repo_name    = "patient-service"
  appointment_service_repo_name = "appointment-service"
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

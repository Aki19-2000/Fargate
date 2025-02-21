resource "aws_ecs_cluster" "main" {
  name = var.ecs_cluster_name
}

# Patient Service ECS Task Definition
resource "aws_ecs_task_definition" "patient_service" {
  family                   = var.ecs_task_family
  execution_role_arn       = var.ecs_execution_role_arn
  task_role_arn            = var.ecs_task_role_arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  cpu       = "256"
  memory    = "512"

  container_definitions = jsonencode([{
    name      = "patient-service"
    image     = var.patient_service_image
    cpu       = 256
    memory    = 512
    essential = true
    portMappings = [
      {
        containerPort = 3001
        hostPort      = 3001
        protocol      = "tcp"
      }
    ]
  }])
}

# Appointment Service ECS Task Definition
resource "aws_ecs_task_definition" "appointment_service" {
  family                   = var.ecs_task_family
  execution_role_arn       = var.ecs_execution_role_arn
  task_role_arn            = var.ecs_task_role_arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  cpu       = "256"
  memory    = "512"

  container_definitions = jsonencode([{
    name      = "appointment-service"
    image     = var.appointment_service_image
    cpu       = 256
    memory    = 512
    essential = true
    portMappings = [
      {
        containerPort = 3002
        hostPort      = 3002
        protocol      = "tcp"
      }
    ]
  }])
}

# Patient Service ECS Service with Load Balancer Configuration
resource "aws_ecs_service" "patient_service" {
  name            = "patient-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.patient_service.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = var.patient_tg_arn  # Pass the target group ARN here
    container_name   = "patient-service"
    container_port   = 3001
  }

  network_configuration {
    subnets          = [var.subnet_id]
    security_groups = [var.security_group_id]
    assign_public_ip = true
  }
}

# Appointment Service ECS Service with Load Balancer Configuration
resource "aws_ecs_service" "appointment_service" {
  name            = "appointment-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.appointment_service.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = var.appointment_tg_arn  # Pass the target group ARN here
    container_name   = "appointment-service"
    container_port   = 3002
  }

  network_configuration {
    subnets          = [var.subnet_id]
    security_groups = [var.security_group_id]
    assign_public_ip = true
  }
}

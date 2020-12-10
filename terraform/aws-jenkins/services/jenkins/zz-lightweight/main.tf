data "aws_iam_policy_document" "ecs_assume" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_cloudwatch_log_group" "zz_lightweight" {
  name              = "/${var.prefix}/${var.jenkins_name}/zz-lightweight"
  retention_in_days = 7
}

# resource "aws_service_discovery_service" "zz_lightweight" {
#   name        = "${var.hostname}.${var.subdomain}"
#   description = "${var.hostname}.${var.subdomain}.${var.domain}"

#   dns_config {
#     namespace_id = var.dns_namespace.id

#     dns_records {
#       ttl  = 10
#       type = "A"
#     }

#     routing_policy = "MULTIVALUE"
#   }

#   health_check_custom_config {
#     failure_threshold = 1
#   }
# }

resource "aws_iam_role" "zz_lightweight" {
  name               = "${var.prefix}-${var.jenkins_name}-zz-lightweight"
  assume_role_policy = data.aws_iam_policy_document.ecs_assume.json
}

resource "aws_security_group" "zz_lightweight" {
  name        = "${var.prefix}-${var.jenkins_name}-zz-lightweight"
  # description = ""
  vpc_id      = var.vpc_id

  ingress {
    description = "App"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = var.private_subnets_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.prefix}-${var.jenkins_name}-zz-lightweight"
  }
}

resource "aws_ecs_service" "zz_lightweight" {
  # LATEST isn't most recent, need to specify platform_version to mount EFS on Fargate
  # https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html
  platform_version = var.context == "EC2" ? "" : "1.4.0"
  name             = "${var.prefix}-${var.jenkins_name}-zz-lightweight"
  cluster          = var.ecs_cluster.id
  task_definition  = aws_ecs_task_definition.zz_lightweight.arn
  launch_type      = var.context
  desired_count    = var.stopped ? 0 : 1

  # service_registries {
  #   registry_arn = aws_service_discovery_service.zz_lightweight.arn
  # }

  network_configuration {
    subnets          = var.private_subnets
    assign_public_ip = false
    security_groups  = [aws_security_group.zz_lightweight.id]
  }
}

resource "aws_ecs_task_definition" "zz_lightweight" {
  family = "${var.prefix}-${var.jenkins_name}-zz-lightweight"

  container_definitions = templatefile("${path.module}/files/tasks/zz_lightweight.tpl", {
    cloudwatch_log_group  = aws_cloudwatch_log_group.zz_lightweight.name
    cloudwatch_log_prefix = "zz-lightweight"
    container_name        = var.hostname
    container_image       = var.image
    region                = var.region
  })

  execution_role_arn = var.ecs_role.arn
  task_role_arn      = aws_iam_role.zz_lightweight.arn

  requires_compatibilities = ["FARGATE"]

  cpu    = var.cpu
  memory = var.memory

  network_mode = "awsvpc"
}

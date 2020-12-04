
resource "aws_ecs_task_definition" "worker" {
  for_each = var.images

  family = "${var.prefix}-${var.hostname}-${each.key}"

  container_definitions = templatefile("${path.module}/files/tasks/worker.tpl", {
    cloudwatch_log_group  = aws_cloudwatch_log_group.jenkins_workers.name
    cloudwatch_log_prefix = each.key
    container_name        = "${var.prefix}-${var.hostname}-${each.key}"
    container_image       = each.value
    region                = var.region
    profiledata_key_arn   = var.profiledata_key.arn
    node_class            = var.hostname == "server" ? "build" : "cv"
    node_product          = "couchbase-server"
  })
  execution_role_arn = var.ecs_role.arn
  # requires_compatibilities = ["FARGATE"]

  cpu    = var.worker_cpu
  memory = var.worker_memory

  network_mode = "awsvpc"
}

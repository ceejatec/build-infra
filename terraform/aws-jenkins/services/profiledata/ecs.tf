resource "aws_ecs_service" "profiledata" {
  # depends_on = [time_sleep.wait_10_seconds]
  # LATEST isn't most recent, need to specify platform_version to mount EFS on Fargate
  # https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html
  platform_version = var.context == "EC2" ? "" : "1.4.0"
  name             = "${var.prefix}-profiledata"
  cluster          = var.ecs_cluster.id
  task_definition  = aws_ecs_task_definition.profiledata.arn
  launch_type      = var.context
  desired_count    = var.stopped ? 0 : 1

  service_registries {
    registry_arn = aws_service_discovery_service.profiledata.arn
  }

  network_configuration {
    subnets          = var.private_subnets
    assign_public_ip = false
    security_groups  = [aws_security_group.profiledata.id]
  }
}

resource "aws_ecs_task_definition" "profiledata" {
  family = "${var.prefix}-profiledata"

  container_definitions = templatefile("${path.module}/files/tasks/profiledata.tpl", {
    cloudwatch_log_group  = aws_cloudwatch_log_group.profiledata.name
    cloudwatch_log_prefix = "profiledata"
    container_name        = var.hostname
    container_image       = var.image
    region                = var.region
    # Client ssh pub key
    profiledata_pubkey = aws_ssm_parameter.profiledata_pubkey.arn
    # Host keys
    profiledata_ssh_host_rsa_key        = aws_ssm_parameter.profiledata_ssh_host_rsa_key.arn
    profiledata_ssh_host_rsa_pubkey     = aws_ssm_parameter.profiledata_ssh_host_rsa_pubkey.arn
    profiledata_ssh_host_ed25519_key    = aws_ssm_parameter.profiledata_ssh_host_ed25519_key.arn
    profiledata_ssh_host_ed25519_pubkey = aws_ssm_parameter.profiledata_ssh_host_ed25519_pubkey.arn
    profiledata_ssh_host_ecdsa_key      = aws_ssm_parameter.profiledata_ssh_host_ecdsa_key.arn
    profiledata_ssh_host_ecdsa_pubkey   = aws_ssm_parameter.profiledata_ssh_host_ecdsa_pubkey.arn
    profiledata_ssh_host_dsa_key        = aws_ssm_parameter.profiledata_ssh_host_dsa_key.arn
    profiledata_ssh_host_dsa_pubkey     = aws_ssm_parameter.profiledata_ssh_host_dsa_pubkey.arn
    # Config files
    couchbase_server_macos_cv_ssh_config     = aws_ssm_parameter.couchbase_server_macos_cv_ssh_config.arn
    couchbase_server_shared_ssh_environment  = aws_ssm_parameter.couchbase_server_shared_ssh_environment.arn
    couchbase_server_shared_gitconfig        = aws_ssm_parameter.couchbase_server_shared_gitconfig.arn
    couchbase_server_shared_m2_settings      = aws_ssm_parameter.couchbase_server_shared_m2_settings.arn
    couchbase_server_linux_cv_ssh_config     = aws_ssm_parameter.couchbase_server_linux_cv_ssh_config.arn
    couchbase_server_linux_build_ssh_config  = aws_ssm_parameter.couchbase_server_linux_build_ssh_config.arn
    couchbase_server_windows_config          = aws_ssm_parameter.couchbase_server_windows_config.arn
    couchbase_server_windows_authorized_keys = aws_ssm_parameter.couchbase_server_windows_authorized_keys.arn
    couchbase_server_windows_environment     = aws_ssm_parameter.couchbase_server_windows_environment.arn
    couchbase_server_windows_known_hosts     = aws_ssm_parameter.couchbase_server_windows_known_hosts.arn
    # Secrets
  })
  execution_role_arn = var.ecs_iam_role.arn
  task_role_arn      = aws_iam_role.profiledata.arn

  requires_compatibilities = ["FARGATE"]

  cpu    = var.cpu
  memory = var.memory

  network_mode = "awsvpc"
}

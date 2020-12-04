output "url" {
  value = var.stopped || var.lb_stopped ? "(disabled)" : "http://${aws_lb.jenkins_master[0].dns_name}"
}

output "master_iam_policy" {
  value = aws_iam_policy.jenkins_master
}

output "efs_access_point" {
  value = aws_efs_access_point.jenkins_home
}

output "master_iam_role" {
  value = aws_iam_role.jenkins_master
}


output "cloud_config" {
  value = templatefile("${path.module}/files/config/clouds.tpl", {
    cloud_name            = var.ecs_cluster.name
    task_prefix           = var.prefix
    cluster_arn           = var.ecs_cluster.arn
    region                = var.region
    jenkins_tunnel        = "${local.fqdn}:${var.jnlp_port}"
    jenkins_url           = "http://${local.fqdn}:8080"
    execution_role        = var.ecs_execution_role.arn
    security_groups       = aws_security_group.jenkins_worker.id
    subnets               = join(",", var.private_subnets)
    cloudwatch_log_group  = aws_cloudwatch_log_group.jenkins_workers.name
    cloudwatch_log_prefix = "worker"
  })
}

output "master_security_group" {
  value = aws_security_group.jenkins_master
}

output "worker_security_group" {
  value = aws_security_group.jenkins_worker
}

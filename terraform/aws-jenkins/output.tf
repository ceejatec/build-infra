output "cv_jenkins_url" {
  value = module.cv_jenkins.url
}

output "server_jenkins_url" {
  value = module.server_jenkins.url
}

output "bastion_ssh" {
  value = module.bastion.ssh_cmd
}

data "http" "ifconfig" {
  url = "http://ifconfig.io/ip"
}

output "add_yourself_to_load_balancer_and_bastion_security_groups" {
  value = "${trim(data.http.ifconfig.body, "\n")}/32"
}

output "jenkins_ecs_config" {
  value = module.server_jenkins.cloud_config
}
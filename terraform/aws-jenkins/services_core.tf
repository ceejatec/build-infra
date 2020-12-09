resource "aws_efs_file_system_policy" "main" {
  file_system_id = aws_efs_file_system.main.id
  policy = templatefile("files/policies/efs_access.tpl", {
    filesystem_arn                     = aws_efs_file_system.main.arn

    analytics_jenkins_access_point_arn = module.analytics_jenkins.efs_access_point.arn
    analytics_jenkins_principals       = "[\"${module.analytics_jenkins.master_iam_role.arn}\",\"${module.bastion.iam_role.arn}\"]"

    cv_jenkins_access_point_arn        = module.cv_jenkins.efs_access_point.arn
    cv_jenkins_principals              = "[\"${module.cv_jenkins.master_iam_role.arn}\",\"${module.bastion.iam_role.arn}\"]"

    server_jenkins_access_point_arn    = module.server_jenkins.efs_access_point.arn
    server_jenkins_principals          = "[\"${module.server_jenkins.master_iam_role.arn}\",\"${module.bastion.iam_role.arn}\"]"

    mobile_jenkins_access_point_arn    = module.mobile_jenkins.efs_access_point.arn
    mobile_jenkins_principals          = "[\"${module.mobile_jenkins.master_iam_role.arn}\",\"${module.bastion.iam_role.arn}\"]"

    nexus_access_point_arn             = module.nexus.efs_access_point.arn
    nexus_principals                   = "[\"${module.nexus.iam_role.arn}\",\"${module.bastion.iam_role.arn}\"]"

    downloads_access_point_arn         = module.downloads.efs_access_point.arn
    downloads_principals               = "[\"${module.downloads.iam_role.arn}\",\"${module.bastion.iam_role.arn}\"]"

    latestbuilds_access_point_arn      = module.latestbuilds.efs_access_point.arn
    latestbuilds_principals            = "[\"${module.latestbuilds.iam_role.arn}\",\"${module.bastion.iam_role.arn}\"]"
  })
}

module "bastion" {
  source  = "./services/bastion"
  stopped = !local.bastion_enabled
  prefix  = local.name
  vpc_id  = module.vpc.vpc_id

  efs_security_group = aws_security_group.efs

  instance_type                 = local.bastion_instance_type
  public_subnets                = module.vpc.public_subnets
  latestbuilds_access_point     = module.latestbuilds.efs_access_point
  nexus_access_point            = module.nexus.efs_access_point
  downloads_access_point        = module.downloads.efs_access_point

  analytics_jenkins_access_point       = module.analytics_jenkins.efs_access_point
  analytics_jenkins_security_group     = module.analytics_jenkins.master_security_group
  analytics_jenkins_iam_policy         = module.analytics_jenkins.master_iam_policy

  cv_jenkins_access_point       = module.cv_jenkins.efs_access_point
  cv_jenkins_security_group     = module.cv_jenkins.master_security_group
  cv_jenkins_iam_policy         = module.cv_jenkins.master_iam_policy

  server_jenkins_access_point   = module.server_jenkins.efs_access_point
  server_jenkins_security_group = module.server_jenkins.master_security_group
  server_jenkins_iam_policy     = module.server_jenkins.master_iam_policy

  mobile_jenkins_access_point   = module.mobile_jenkins.efs_access_point
  mobile_jenkins_security_group = module.mobile_jenkins.master_security_group
  mobile_jenkins_iam_policy     = module.mobile_jenkins.master_iam_policy

  efs_file_system               = aws_efs_file_system.main
  ssh_key_path                  = local.ssh_key_path
}

module "go_proxy" {
  source                      = "./services/go_proxy"
  prefix                      = local.name
  vpc_id                      = module.vpc.vpc_id
  ecs_cluster                 = aws_ecs_cluster.main
  private_subnets_cidr_blocks = module.vpc.private_subnets_cidr_blocks

  hostname  = local.go_proxy_name
  subdomain = local.go_proxy_subdomain
  domain    = local.private_domain

  stopped = local.stopped
  context = local.go_proxy_context

  dns_namespace   = aws_service_discovery_private_dns_namespace.main
  private_subnets = module.vpc.private_subnets
  ecs_role        = aws_iam_role.ecs
  image           = local.go_proxy_image
  region          = local.region
  cpu             = local.go_proxy_cpu
  memory          = local.go_proxy_memory
}

module "latestbuilds" {
  source = "./services/latestbuilds"
  prefix = local.name

  efs_security_group = aws_security_group.efs

  cpu                         = local.latestbuilds_cpu
  memory                      = local.latestbuilds_memory
  image                       = local.latestbuilds_image
  region                      = local.region
  stopped                     = local.stopped
  context                     = local.latestbuilds_context
  hostname                    = local.latestbuilds_name
  subdomain                   = local.latestbuilds_subdomain
  domain                      = local.private_domain
  vpc_id                      = module.vpc.vpc_id
  private_subnets             = module.vpc.private_subnets
  efs_file_system             = aws_efs_file_system.main
  ecs_execution_role          = aws_iam_role.ec2_ecs
  dns_namespace               = aws_service_discovery_private_dns_namespace.main
  private_subnets_cidr_blocks = module.vpc.private_subnets_cidr_blocks
  ecs_cluster                 = aws_ecs_cluster.main
  bastion_security_group      = module.bastion.security_group
}

module "profiledata" {
  source                      = "./services/profiledata"
  prefix                      = local.name
  cpu                         = local.profiledata_cpu
  memory                      = local.profiledata_memory
  image                       = local.profiledata_image
  region                      = local.region
  stopped                     = local.stopped
  context                     = local.profiledata_context
  hostname                    = local.profiledata_name
  subdomain                   = local.profiledata_subdomain
  domain                      = local.private_domain
  vpc_id                      = module.vpc.vpc_id
  private_subnets             = module.vpc.private_subnets
  ecs_execution_role          = aws_iam_role.ec2_ecs
  private_subnets_cidr_blocks = module.vpc.private_subnets_cidr_blocks
  dns_namespace               = aws_service_discovery_private_dns_namespace.main
  ecs_cluster                 = aws_ecs_cluster.main
  ecs_iam_role                = aws_iam_role.ecs
}

module "nexus" {
  source = "./services/nexus"
  prefix = local.name

  efs_security_group = aws_security_group.efs

  cpu                         = local.nexus_cpu
  memory                      = local.nexus_memory
  image                       = local.nexus_image
  region                      = local.region
  stopped                     = local.stopped
  context                     = local.nexus_context
  hostname                    = local.nexus_name
  subdomain                   = local.nexus_subdomain
  domain                      = local.private_domain
  vpc_id                      = module.vpc.vpc_id
  private_subnets             = module.vpc.private_subnets
  efs_file_system             = aws_efs_file_system.main
  ecs_execution_role          = aws_iam_role.ec2_ecs
  dns_namespace               = aws_service_discovery_private_dns_namespace.main
  private_subnets_cidr_blocks = module.vpc.private_subnets_cidr_blocks
  ecs_cluster                 = aws_ecs_cluster.main
  bastion_security_group      = module.bastion.security_group
}

module "downloads" {
  source = "./services/downloads"
  prefix = local.name

  efs_security_group = aws_security_group.efs

  cpu                         = local.downloads_cpu
  memory                      = local.downloads_memory
  image                       = local.downloads_image
  region                      = local.region
  stopped                     = local.stopped
  context                     = local.downloads_context
  hostname                    = local.downloads_name
  subdomain                   = local.downloads_subdomain
  domain                      = local.private_domain
  vpc_id                      = module.vpc.vpc_id
  private_subnets             = module.vpc.private_subnets
  efs_file_system             = aws_efs_file_system.main
  ecs_execution_role          = aws_iam_role.ec2_ecs
  dns_namespace               = aws_service_discovery_private_dns_namespace.main
  private_subnets_cidr_blocks = module.vpc.private_subnets_cidr_blocks
  ecs_cluster                 = aws_ecs_cluster.main
  bastion_security_group      = module.bastion.security_group
}


# module "server_jenkins" {
#   source  = "./services/jenkins"
#   stopped = false
#   prefix  = local.name

#   ui_port       = local.server_ui_port
#   jnlp_port     = local.server_jnlp_port
#   hostname      = local.server_name
#   subdomain     = local.server_subdomain
#   image         = local.server_image
#   master_cpu    = local.server_cpu
#   master_memory = local.server_memory
#   context       = local.server_context

#   efs_security_group = aws_security_group.efs

#   domain              = local.private_domain
#   dns_namespace       = aws_service_discovery_private_dns_namespace.main
#   worker_cpu          = local.worker_cpu
#   worker_memory       = local.worker_memory
#   vpc_id              = module.vpc.vpc_id
#   ecs_cluster         = aws_ecs_cluster.main
#   private_key         = tls_private_key.main
#   public_subnets      = module.vpc.public_subnets
#   private_subnets     = module.vpc.private_subnets
#   ecs_task_runner_arn = aws_iam_policy.ecs_task_runner.arn
#   efs_file_system     = aws_efs_file_system.main
#   ecs_execution_role  = aws_iam_role.ec2_ecs
#   ecs_role            = aws_iam_role.ecs
#   profiledata_key     = module.profiledata.key
#   region              = local.region

#   images = {
#     "amzn2"    = "284614897128.dkr.ecr.us-east-1.amazonaws.com/server-amzn2-build:latest"
#     "centos7"  = "284614897128.dkr.ecr.us-east-1.amazonaws.com/server-centos7-build:latest"
#     "centos8"  = "284614897128.dkr.ecr.us-east-1.amazonaws.com/server-centos8-build:latest"
#     "debian8"  = "284614897128.dkr.ecr.us-east-1.amazonaws.com/server-debian8-build:latest"
#     "debian9"  = "284614897128.dkr.ecr.us-east-1.amazonaws.com/server-debian9-build:latest"
#     "debian10" = "284614897128.dkr.ecr.us-east-1.amazonaws.com/server-debian10-build:latest"
#     "suse15"   = "284614897128.dkr.ecr.us-east-1.amazonaws.com/server-suse15-build:latest"
#     "ubuntu16" = "284614897128.dkr.ecr.us-east-1.amazonaws.com/server-ubuntu16-build:latest"
#     "ubuntu18" = "284614897128.dkr.ecr.us-east-1.amazonaws.com/server-ubuntu18-build:latest"
#     "ubuntu20" = "284614897128.dkr.ecr.us-east-1.amazonaws.com/server-ubuntu20-build:latest"
#   }
# }


# module "cv_jenkins" {
#   source  = "./services/jenkins"
#   stopped = false
#   prefix  = local.name

#   ui_port       = local.cv_ui_port
#   jnlp_port     = local.cv_jnlp_port
#   hostname      = local.cv_name
#   subdomain     = local.cv_subdomain
#   image         = local.cv_image
#   master_cpu    = local.cv_cpu
#   master_memory = local.cv_memory
#   context       = local.cv_context

#   efs_security_group = aws_security_group.efs

#   domain              = local.private_domain
#   dns_namespace       = aws_service_discovery_private_dns_namespace.main
#   worker_cpu          = local.worker_cpu
#   worker_memory       = local.worker_memory
#   vpc_id              = module.vpc.vpc_id
#   ecs_cluster         = aws_ecs_cluster.main
#   private_key         = tls_private_key.main
#   public_subnets      = module.vpc.public_subnets
#   private_subnets     = module.vpc.private_subnets
#   ecs_task_runner_arn = aws_iam_policy.ecs_task_runner.arn
#   efs_file_system     = aws_efs_file_system.main
#   ecs_execution_role  = aws_iam_role.ec2_ecs
#   ecs_role            = aws_iam_role.ecs
#   profiledata_key     = module.profiledata.key
#   region              = local.region

#   images = {
#     "ubuntu18" = "284614897128.dkr.ecr.us-east-1.amazonaws.com/server-ubuntu18-build:latest"
#   }
# }

module "mobile_jenkins" {
  source  = "./services/jenkins"
  stopped = false
  prefix  = local.name
  lb_stopped = local.lbs_stopped

  ui_port       = local.mobile_ui_port
  jnlp_port     = local.mobile_jnlp_port
  hostname      = local.mobile_name
  subdomain     = local.mobile_subdomain
  image         = local.mobile_image
  master_cpu    = local.mobile_cpu
  master_memory = local.mobile_memory
  context       = local.mobile_context

  efs_security_group = aws_security_group.efs

  domain              = local.private_domain
  dns_namespace       = aws_service_discovery_private_dns_namespace.main
  worker_cpu          = local.worker_cpu
  worker_memory       = local.worker_memory
  vpc_id              = module.vpc.vpc_id
  ecs_cluster         = aws_ecs_cluster.main
  private_key         = tls_private_key.main
  public_subnets      = module.vpc.public_subnets
  private_subnets     = module.vpc.private_subnets
  ecs_task_runner_arn = aws_iam_policy.ecs_task_runner.arn
  efs_file_system     = aws_efs_file_system.main
  ecs_execution_role  = aws_iam_role.ec2_ecs
  ecs_role            = aws_iam_role.ecs
  profiledata_key     = module.profiledata.key
  region              = local.region

  #mobile doesn't need these
  images = {
    #"litecore-centos6"     = "284614897128.dkr.ecr.us-east-1.amazonaws.com/litecore-centos-69-build"
    #"litecore-centos6-gcc" = "284614897128.dkr.ecr.us-east-1.amazonaws.com/litecore-centos-69-gcc-build"
    #"litecore-centos72"    = "284614897128.dkr.ecr.us-east-1.amazonaws.com/litecore-centos-72-build"
    #"litecore-centos73"    = "284614897128.dkr.ecr.us-east-1.amazonaws.com/litecore-centos-73-build"
    #"litecore-ubuntu14"    = "284614897128.dkr.ecr.us-east-1.amazonaws.com/litecore-ubuntu-1404-build"
    #"sgw-centos6"          = "284614897128.dkr.ecr.us-east-1.amazonaws.com/sgw-centos6-build"
    #"sgw-centos7"          = "284614897128.dkr.ecr.us-east-1.amazonaws.com/sgw-centos7-build"
    #"sgw-ubuntu16"         = "284614897128.dkr.ecr.us-east-1.amazonaws.com/sgw-ubuntu16-build"
    #"liteandroid-ubuntu18" = "284614897128.dkr.ecr.us-east-1.amazonaws.com/liteandroid-ubuntu-1804-build"
  }
}

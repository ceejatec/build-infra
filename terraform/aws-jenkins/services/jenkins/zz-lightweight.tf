module "zz_lightweight" {
    source = "./zz-lightweight"

    prefix = var.prefix
    vpc_id = var.vpc_id

    ecs_role = var.ecs_role
    image    = "284614897128.dkr.ecr.us-east-1.amazonaws.com/server-zz-lightweight"
    region   = var.region

    cpu    = "1024"
    memory = "4096"
    ecs_cluster   = var.ecs_cluster
    dns_namespace = var.dns_namespace
    hostname      = "zz-lightweight"
    jenkins_name = var.hostname
    subdomain     = var.subdomain
    domain        = var.domain
    stopped       = var.stopped
    context       = "EC2"

    private_subnets             = var.private_subnets
    private_subnets_cidr_blocks = var.private_subnets_cidr_blocks
}
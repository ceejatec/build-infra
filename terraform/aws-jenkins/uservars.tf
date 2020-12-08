locals {
  stopped         = false # if true, does not bring up any instances
  bastion_enabled = true  # enable to create a bastion instance with ssh access for your IP
  lbs_stopped     = false  # don't change this after going live, or we'll need dns updates as lb fqdns will change
  jenkins_stopped = false  # stops all jenkins masters

  ssh_key_path = "/tmp/aws-migration.pem" # key will be saved here on `terraform apply` if the file doesn't exist

  name           = "migration" # generally appears as a prefix
  region         = "us-east-1"
  private_domain = "couchbase.com"

  cidr            = "10.0.0.0/16"
  public_subnets  = ["10.0.0.0/24", "10.0.1.0/24"]
  private_subnets = ["10.0.2.0/23", "10.0.4.0/23"]

  bastion_instance_type = "t2.large"

  ec2_instance_type = "c5ad.4xlarge"
  ec2_max_instances = 4


  # latestbuilds
  latestbuilds_context   = "EC2"
  latestbuilds_name      = "latestbuilds" #cnt-s231.sc - /data/builds/latestbuilds (also /data/buildteam as buildteam and /data/builds/releases as releases)
  latestbuilds_subdomain = "service"
  latestbuilds_image     = "284614897128.dkr.ecr.us-east-1.amazonaws.com/latestbuilds"
  latestbuilds_cpu       = 1024
  latestbuilds_memory    = 2048

  # go proxy
  go_proxy_context   = "EC2"
  go_proxy_name      = "goproxy"
  go_proxy_subdomain = "build"
  go_proxy_image     = "gomods/athens:v0.9.0"
  go_proxy_cpu       = 1024
  go_proxy_memory    = 2048

  # profiledata
  profiledata_context   = "EC2"
  profiledata_name      = "profiledata"
  profiledata_subdomain = "build"
  profiledata_image     = "284614897128.dkr.ecr.us-east-1.amazonaws.com/profiledata:latest"
  profiledata_cpu       = 512
  profiledata_memory    = 1024
}

resource "random_string" "key_file" {
  length  = 16
  special = false
}

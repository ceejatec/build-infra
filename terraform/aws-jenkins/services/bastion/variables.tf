variable "prefix" {}
variable "vpc_id" {}
variable "stopped" {}
variable "instance_type" {}
variable "public_subnets" {}

variable "efs_file_system" {}

variable "latestbuilds_access_point" {}

variable "cv_jenkins_iam_policy" {}
variable "cv_jenkins_access_point" {}
variable "cv_jenkins_security_group" {}

variable "server_jenkins_iam_policy" {}
variable "server_jenkins_access_point" {}
variable "server_jenkins_security_group" {}

variable "ssh_key_path" {}

variable "efs_security_group" {}

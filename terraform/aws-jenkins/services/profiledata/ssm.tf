resource "aws_ssm_parameter" "couchbase_server_macos_cv_ssh_config" {
  name  = "${var.prefix}-couchbase_server_macos_cv_ssh_config"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/macos/cv/.ssh/config")
}
resource "aws_ssm_parameter" "couchbase_server_shared_m2_settings" {
  name  = "${var.prefix}-couchbase_server_shared_m2_settings"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/shared/.m2/settings.xml")
}
resource "aws_ssm_parameter" "couchbase_server_shared_ssh_environment" {
  name  = "${var.prefix}-couchbase_server_shared_ssh_environment"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/shared/.ssh/environment")
}
resource "aws_ssm_parameter" "couchbase_server_shared_gitconfig" {
  name  = "${var.prefix}-couchbase_server_shared_gitconfig"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/shared/.gitconfig")
}
resource "aws_ssm_parameter" "couchbase_server_linux_cv_ssh_config" {
  name  = "${var.prefix}-couchbase_server_linux_cv_ssh_config"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/linux/cv/.ssh/config")
}
resource "aws_ssm_parameter" "couchbase_server_linux_build_ssh_config" {
  name  = "${var.prefix}-couchbase_server_linux_build_ssh_config"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/linux/build/.ssh/config")
}
resource "aws_ssm_parameter" "couchbase_server_windows_config" {
  name  = "${var.prefix}-couchbase_server_windows_config"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/windows/config")
}
resource "aws_ssm_parameter" "couchbase_server_windows_authorized_keys" {
  name  = "${var.prefix}-couchbase_server_windows_authorized_keys"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/windows/authorized_keys")
}
resource "aws_ssm_parameter" "couchbase_server_windows_environment" {
  name  = "${var.prefix}-couchbase_server_windows_environment"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/windows/environment")
}
resource "aws_ssm_parameter" "couchbase_server_windows_known_hosts" {
  name  = "${var.prefix}-couchbase_server_windows_known_hosts"
  type  = "SecureString"
  tier  = "Advanced"
  value = file("~/aws-ssh/couchbase-server/windows/known_hosts")
}

# CLIENT KEY
resource "aws_ssm_parameter" "profiledata_key" {
  name  = "${var.prefix}-profiledata-key"
  type  = "SecureString"
  value = file("~/aws-ssh/profiledata")
}

resource "aws_ssm_parameter" "profiledata_pubkey" {
  name  = "${var.prefix}-profiledata-pubkey"
  type  = "SecureString"
  value = file("~/aws-ssh/profiledata.pub")
}

# HOST KEYS
resource "aws_ssm_parameter" "profiledata_ssh_host_rsa_pubkey" {
  name  = "${var.prefix}-profiledata_ssh_host_rsa_pubkey"
  type  = "SecureString"
  value = file("~/aws-ssh/profiledata_ssh_host_rsa_key.pub")
}
resource "aws_ssm_parameter" "profiledata_ssh_host_rsa_key" {
  name  = "${var.prefix}-profiledata_ssh_host_rsa_key"
  type  = "SecureString"
  value = file("~/aws-ssh/profiledata_ssh_host_rsa_key")
}
resource "aws_ssm_parameter" "profiledata_ssh_host_ed25519_key" {
  name  = "${var.prefix}-profiledata_ssh_host_ed25519_key"
  type  = "SecureString"
  value = file("~/aws-ssh/profiledata_ssh_host_ed25519_key")
}
resource "aws_ssm_parameter" "profiledata_ssh_host_ed25519_pubkey" {
  name  = "${var.prefix}-profiledata_ssh_host_ed25519_pubkey"
  type  = "SecureString"
  value = file("~/aws-ssh/profiledata_ssh_host_ed25519_key.pub")
}

resource "aws_ssm_parameter" "profiledata_ssh_host_ecdsa_key" {
  name  = "${var.prefix}-profiledata_ssh_host_ecdsa_key"
  type  = "SecureString"
  value = file("~/aws-ssh/profiledata_ssh_host_ecdsa_key")
}
resource "aws_ssm_parameter" "profiledata_ssh_host_ecdsa_pubkey" {
  name  = "${var.prefix}-profiledata_ssh_host_ecdsa_pubkey"
  type  = "SecureString"
  value = file("~/aws-ssh/profiledata_ssh_host_ecdsa_key.pub")
}
resource "aws_ssm_parameter" "profiledata_ssh_host_dsa_key" {
  name  = "${var.prefix}-profiledata_ssh_host_dsa_key"
  type  = "SecureString"
  value = file("~/aws-ssh/profiledata_ssh_host_dsa_key")
}
resource "aws_ssm_parameter" "profiledata_ssh_host_dsa_pubkey" {
  name  = "${var.prefix}-profiledata_ssh_host_dsa_pubkey"
  type  = "SecureString"
  value = file("~/aws-ssh/profiledata_ssh_host_dsa_key.pub")
}
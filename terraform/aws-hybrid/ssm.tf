##########
# Shared #
##########

resource "aws_ssm_parameter" "shared_ssh_authorized_keys" {
  name  = "jenkins-worker__shared__.ssh__authorized_keys"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/build/linux/.ssh/authorized_keys")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "shared"
  }
}

######
# CV #
######

resource "aws_ssm_parameter" "couchbase_server_cv_linux_gitconfig" {
  name  = "jenkins-worker__cv__.gitconfig"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/cv/linux/.gitconfig")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "cv"
  }
}

resource "aws_ssm_parameter" "couchbase_server_cv_linux_ssh_config" {
  name  = "jenkins-worker__cv__.ssh__config"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/cv/linux/.ssh/config")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "cv"
  }
}

resource "aws_ssm_parameter" "couchbase_server_cv_linux_ssh_known_hosts" {
  name  = "jenkins-worker__cv__.ssh__known_hosts"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/cv/linux/.ssh/known_hosts")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "cv"
  }
}

resource "aws_ssm_parameter" "couchbase_server_cv_linux_ssh_environment" {
  name  = "jenkins-worker__cv__.ssh__environment"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/cv/linux/.ssh/environment")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "cv"
  }
}

resource "aws_ssm_parameter" "couchbase_server_cv_linux_ssh_id_ns_codereview" {
  name  = "jenkins-worker__cv__.ssh__id_ns-codereview"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/cv/linux/.ssh/id_ns-codereview")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "cv"
  }
}

resource "aws_ssm_parameter" "couchbase_server_cv_linux_ssh_ns_buildbot_rsa" {
  name  = "jenkins-worker__cv__.ssh__ns-buildbot.rsa"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/cv/linux/.ssh/ns-buildbot.rsa")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "cv"
  }
}

resource "aws_ssm_parameter" "couchbase_server_cv_linux_ssh_patch_via_gerrit_ini" {
  name  = "jenkins-worker__cv__.ssh__patch_via_gerrit.ini"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/cv/linux/.ssh/patch_via_gerrit.ini")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "cv"
  }
}

resource "aws_ssm_parameter" "couchbase_server_cv_linux_ssh_id_buildbot" {
  name  = "jenkins-worker__cv__.ssh__id_buildbot"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/cv/linux/.ssh/id_buildbot")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "cv"
  }
}

resource "aws_ssm_parameter" "couchbase_server_cv_linux_ssh_buildbot_id_dsa" {
  name  = "jenkins-worker__cv__.ssh__buildbot_id_dsa"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/cv/linux/.ssh/buildbot_id_dsa")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "cv"
  }
}


##########
# Server #
##########

resource "aws_ssm_parameter" "server_ssh_config" {
  name  = "jenkins-worker__server__.ssh__config"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/build/linux/.ssh/config")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "server"
  }
}

resource "aws_ssm_parameter" "server_ssh_known_hosts" {
  name  = "jenkins-worker__server__.ssh__known_hosts"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/build/linux/.ssh/known_hosts")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "server"
  }
}

resource "aws_ssm_parameter" "server_ssh_environment" {
  name  = "jenkins-worker__server__.ssh__environment"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/build/linux/.ssh/environment")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "server"
  }
}

resource "aws_ssm_parameter" "server_gitconfig" {
  name  = "jenkins-worker__server__.gitconfig"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/build/linux/.gitconfig")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "server"
  }
}

resource "aws_ssm_parameter" "server_gpg_rpm_signing" {
  name  = "jenkins-worker__server__rpm_signing"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/build/linux/.gpg/rpm_signing")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "server"
  }
}

resource "aws_ssm_parameter" "server_ssh_id_buildbot" {
  name  = "jenkins-worker__server__.ssh__id_buildbot"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/build/linux/.ssh/id_buildbot")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "server"
  }
}

resource "aws_ssm_parameter" "server_ssh_id_cb_robot" {
  name  = "jenkins-worker__server__.ssh__id_cb_robot"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/build/linux/.ssh/id_cb-robot")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "server"
  }
}

resource "aws_ssm_parameter" "server_ssh_id_ns_codereview" {
  name  = "jenkins-worker__server__.ssh__id_ns_codereview"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/build/linux/.ssh/id_ns-codereview")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "server"
  }
}

resource "aws_ssm_parameter" "server_ssh_ns_buildbot_rsa" {
  name  = "jenkins-worker__server__.ssh__ns-buildbot.rsa"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/build/linux/.ssh/ns-buildbot.rsa")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "server"
  }
}

resource "aws_ssm_parameter" "server_ssh_patch_via_gerrit_ini" {
  name  = "jenkins-worker__server__.ssh__patch_via_gerrit.ini"
  type  = "SecureString"
  value = file("~/aws-ssh/couchbase-server/build/linux/.ssh/patch_via_gerrit.ini")
  tags = {
    Owner = "build-team"
    Consumer = "jenkins-worker"
    Environment = "server"
  }
}

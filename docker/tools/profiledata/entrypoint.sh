#!/bin/sh

if [ "$AWS_EXECUTION_ENV" != "" ]; then # We're in AWS
  [ "$profiledata_pubkey" = "" ] && echo "profiledata_pubkey not provided!"
  [ "$profiledata_ssh_host_rsa_key" = "" ] && echo "profiledata_ssh_host_rsa_key not provided!"
  [ "$profiledata_ssh_host_rsa_pubkey" = "" ] && echo "profiledata_ssh_host_rsa_pubkey not provided!"
  [ "$profiledata_ssh_host_ed25519_key" = "" ] && echo "profiledata_ssh_host_ed25519_key not provided!"
  [ "$profiledata_ssh_host_ed25519_pubkey" = "" ] && echo "profiledata_ssh_host_ed25519_pubkey not provided!"
  [ "$profiledata_ssh_host_ecdsa_key" = "" ] && echo "profiledata_ssh_host_ecdsa_key not provided!"
  [ "$profiledata_ssh_host_ecdsa_pubkey" = "" ] && echo "profiledata_ssh_host_ecdsa_pubkey not provided!"
  [ "$profiledata_ssh_host_dsa_key" = "" ] && echo "profiledata_ssh_host_dsa_key not provided!"
  [ "$profiledata_ssh_host_dsa_pubkey" = "" ] && echo "profiledata_ssh_host_dsa_pubkey not provided!"

  echo "$profiledata_ssh_host_rsa_key" >/etc/ssh/ssh_host_rsa_key
  echo "$profiledata_ssh_host_rsa_pubkey" >/etc/ssh/ssh_host_rsa_key.pub

  echo "$profiledata_ssh_host_ed25519_key" >/etc/ssh/ssh_host_ed25519_key
  echo "$profiledata_ssh_host_ed25519_pubkey" >/etc/ssh/ssh_host_ed25519_key.pub

  echo "$profiledata_ssh_host_ecdsa_key" >/etc/ssh/ssh_host_ecdsa_key
  echo "$profiledata_ssh_host_ecdsa_pubkey" >/etc/ssh/ssh_host_ecdsa_key.pub

  echo "$profiledata_ssh_host_dsa_key" >/etc/ssh/ssh_host_dsa_key
  echo "$profiledata_ssh_host_dsa_pubkey" >/etc/ssh/ssh_host_dsa_key.pub
  chmod 600 /etc/ssh/ssh_host*

  mkdir -p /home/couchbase/.ssh
  echo "$profiledata_pubkey" >/home/couchbase/.ssh/authorized_keys
  chown couchbase:couchbase /home/couchbase/.ssh/authorized_keys

  for subdir in cv/macos/.ssh shared/.ssh cv/linux/.ssh build/linux/.ssh build/windows/.ssh; do
    mkdir -p "/home/couchbase/couchbase-server/$subdir"
  done

  echo "$couchbase_server_shared_gitconfig"        >/home/couchbase/couchbase-server/shared/.gitconfig
  echo "$couchbase_server_shared_ssh_environment"  >/home/couchbase/couchbase-server/shared/.ssh/environment
  echo "$couchbase_server_linux_cv_ssh_config"     >/home/couchbase/couchbase-server/cv/linux/.ssh/config
  echo "$couchbase_server_macos_cv_ssh_config"     >/home/couchbase/couchbase-server/cv/macos/.ssh/config
  echo "$couchbase_server_linux_build_ssh_config"  >/home/couchbase/couchbase-server/build/linux/.ssh/config
  echo "$couchbase_server_windows_config"          >/home/couchbase/couchbase-server/build/windows/.ssh/config
  echo "$couchbase_server_windows_environment"     >/home/couchbase/couchbase-server/build/windows/.ssh/environment
  echo "$couchbase_server_windows_authorized_keys" >/home/couchbase/couchbase-server/build/windows/.ssh/authorized_keys
fi

exec $@

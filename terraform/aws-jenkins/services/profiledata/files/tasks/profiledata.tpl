[
  {
    "name": "${container_name}",
    "image": "${container_image}",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 4000,
        "hostPort": 4000
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${cloudwatch_log_group}",
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "${cloudwatch_log_prefix}"
        }
    },
    "environment": [
      {
        "name": "aws",
        "value": "true"
      }
    ],
    "secrets": [
      {
        "name": "profiledata_pubkey",
        "valueFrom": "${profiledata_pubkey}"
      },
      {
        "name": "profiledata_ssh_host_rsa_key",
        "valueFrom": "${profiledata_ssh_host_rsa_key}"
      },
      {
        "name": "profiledata_ssh_host_rsa_pubkey",
        "valueFrom": "${profiledata_ssh_host_rsa_pubkey}"
      },
      {
        "name": "profiledata_ssh_host_ed25519_key",
        "valueFrom": "${profiledata_ssh_host_ed25519_key}"
      },
      {
        "name": "profiledata_ssh_host_ed25519_pubkey",
        "valueFrom": "${profiledata_ssh_host_ed25519_pubkey}"
      },
      {
        "name": "profiledata_ssh_host_ecdsa_key",
        "valueFrom": "${profiledata_ssh_host_ecdsa_key}"
      },
      {
        "name": "profiledata_ssh_host_ecdsa_pubkey",
        "valueFrom": "${profiledata_ssh_host_ecdsa_pubkey}"
      },
      {
        "name": "profiledata_ssh_host_dsa_key",
        "valueFrom": "${profiledata_ssh_host_dsa_key}"
      },
      {
        "name": "profiledata_ssh_host_dsa_pubkey",
        "valueFrom": "${profiledata_ssh_host_dsa_pubkey}"
      },
      {
        "name": "couchbase_server_macos_cv_ssh_config",
        "valueFrom": "${couchbase_server_macos_cv_ssh_config}"
      },
      {
        "name": "couchbase_server_shared_m2_settings",
        "valueFrom": "${couchbase_server_shared_m2_settings}"
      },
      {
        "name": "couchbase_server_shared_ssh_environment",
        "valueFrom": "${couchbase_server_shared_ssh_environment}"
      },
      {
        "name": "couchbase_server_shared_gitconfig",
        "valueFrom": "${couchbase_server_shared_gitconfig}"
      },
      {
        "name": "couchbase_server_linux_cv_ssh_config",
        "valueFrom": "${couchbase_server_linux_cv_ssh_config}"
      },
      {
        "name": "couchbase_server_linux_build_ssh_config",
        "valueFrom": "${couchbase_server_linux_build_ssh_config}"
      },
      {
        "name": "couchbase_server_windows_config",
        "valueFrom": "${couchbase_server_windows_config}"
      },
      {
        "name": "couchbase_server_windows_authorized_keys",
        "valueFrom": "${couchbase_server_windows_authorized_keys}"
      },

      {
        "name": "couchbase_server_windows_environment",
        "valueFrom": "${couchbase_server_windows_environment}"
      },
      {
        "name": "couchbase_server_windows_known_hosts",
        "valueFrom": "${couchbase_server_windows_known_hosts}"
      }
    ]
  }
]

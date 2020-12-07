[
  {
    "name": "${container_name}",
    "image": "${container_image}",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 22,
        "hostPort": 22
      },
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ],
    "mountPoints": [
      {
          "sourceVolume": "latestbuilds",
          "containerPath": "/usr/share/nginx/html",
          "readOnly": true
      },
      {
          "sourceVolume": "latestbuilds",
          "containerPath": "/data",
          "readOnly": false
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${cloudwatch_log_group}",
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "${cloudwatch_log_prefix}"
        }
    }
  }
]
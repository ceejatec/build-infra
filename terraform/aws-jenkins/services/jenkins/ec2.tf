resource "aws_lb_target_group" "jenkins_master" {
  name        = "${var.prefix}-${var.hostname}-web"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  health_check {
    enabled             = true
    path                = "/"
    port                = var.ui_port
    protocol            = "HTTP"
    interval            = 30
    healthy_threshold   = 10
    unhealthy_threshold = 10
    timeout             = 15
    matcher             = "200,403" # 403 is normal when not logged in
  }
}

resource "aws_lb" "jenkins_master" {
  count = var.lb_stopped ? 0 : 1
  name               = "${var.prefix}-${var.hostname}-ui"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ui_load_balancer.id]
  subnets            = var.public_subnets

  enable_deletion_protection = false

  # todo: logging
}

resource "aws_lb_listener" "jenkins_master" {
  count = var.lb_stopped ? 0 : 1
  load_balancer_arn = aws_lb.jenkins_master[0].arn

  port     = "80"
  protocol = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins_master.arn
  }
}

resource "aws_lb_listener_rule" "jenkins_master" {
  count = var.lb_stopped ? 0 : 1
  listener_arn = aws_lb_listener.jenkins_master[0].arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins_master.arn
  }

  condition {
    host_header {
      values = [
        "*.amazonaws.com",
        local.fqdn
      ]
    }
  }
}

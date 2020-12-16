resource "aws_lb_target_group" "proget" {
  name        = "${var.prefix}-proget-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  health_check {
    enabled = true
    path = "/feeds/dev"
    port = 80
    protocol = "HTTP"
    interval = 30
    healthy_threshold = 10
    unhealthy_threshold = 10
    timeout = 15
    matcher = "200"
  }
}

resource "aws_lb" "proget" {
  name               = "${var.prefix}-proget-lb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [ aws_security_group.proget_lb.id ]
  subnets            = var.private_subnets

  enable_deletion_protection = false
}

resource "aws_lb_listener" "proget_http" {
  load_balancer_arn = aws_lb.proget.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.proget.arn
  }
}

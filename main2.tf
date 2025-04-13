resource "aws_lb" "terraweb-lb" {
  name               = "terraweb-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-015a80c5e8b53fa22"]
  subnets            = ["subnet-0de5d0617ce4b24a6","subnet-03cde2875fcc4238b"]

  enable_deletion_protection = false
}
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.terraweb-lb.arn
  default_action {
   type = "forward"
   target_group_arn = "aws_lb_target_group.terraweb-tg.arn"
   }
  }
resource "aws_lb_target_group" "terraweb-tg" {
  port              = "80"
  protocol = "HTTP"
  vpc_id = "vpc-06b76541cfa2305ca"
}


resource "aws_alb" "sample_alb" {
    name = "personal-sample-alb"
    internal = false
    load_balancer_type="application"
    ip_address_type="ipv4"
    security_groups=["${aws_security_group.smaple_default.id},${aws_security_group.elb_server.id}"]
    subnets = [ aws_subnet.public1.id,aws_subnet.public2.id ]
    tags = {
      Name = "sample_alb"
    }
}
resource "aws_alb_target_group" "sample_alb_targetgroup" {
    name = "personal-alb-targetgroup"
    target_type = "instance"
    port = 3000
    protocol = "HTTP"
    vpc_id = aws_vpc.sample-vpc.id
    tags = {
      Name = "personal-alb-targetgroup"
    }
    protocol_version = "HTTP1"

}
resource "aws_alb_target_group_attachment" "alb_target_web01" {
    target_group_arn = aws_alb_target_group.sample_alb_targetgroup.arn
    target_id = aws_instance.webserver1.id
    port = 80
}
resource "aws_alb_target_group_attachment" "alb_target_web02" {
    target_group_arn = aws_alb_target_group.sample_alb_targetgroup.arn
    target_id = aws_instance.webserver2.id
    port = 80
}
resource "aws_alb_listener" "personal_alb_listner" {
    load_balancer_arn = aws_alb.sample_alb.arn
    port = 80
    protocol = "HTTP"
    default_action {
      type = "forward"
      target_group_arn = aws_alb_target_group.sample_alb_targetgroup.arn
    }
  
}
resource "aws_security_group" "smaple_default" {
    vpc_id = aws_vpc.sample-vpc.id
    ingress {
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
    egress {
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
    tags = {
      Name = "sample-default"
    }
}
resource "aws_security_group" "bastion_Server" {
    vpc_id = aws_vpc.sample-vpc.id
    ingress {
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }
    tags = {
      Name = "bastion_server_security"
    }
}
resource "aws_security_group" "elb_server" {
    vpc_id = aws_vpc.sample-vpc.id
    ingress {
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }
    ingress {
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 443
        to_port = 443
        protocol = "tcp"
    }
    ingress {
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
    }
    egress {
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
    tags = {
      Name = "elb-server-security"
    }
  
}
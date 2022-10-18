resource "aws_instance" "webserver1" {
    ami = "ami-068a0feb96796b48d"
    instance_type = "t2.micro"
    associate_public_ip_address = false
    subnet_id = aws_subnet.private1.id
    key_name = aws_key_pair.key.key_name
    tags = {
      Name = "webserver1"
    }
    vpc_security_group_ids = [ "${aws_security_group.smaple_default.id}"]
    root_block_device {
      volume_size =8
      volume_type="gp2"
    }
    user_data = "${file("webserver1_appach.sh")}"
}
resource "aws_instance" "webserver2" {
    ami = "ami-068a0feb96796b48d"
    instance_type = "t2.micro"
    associate_public_ip_address = false
    subnet_id = aws_subnet.private2.id
    key_name = aws_key_pair.key.key_name
    tags = {
      Name = "webserver2"
    }
    vpc_security_group_ids = [ "${aws_security_group.smaple_default.id}"]
    root_block_device {
      volume_size =8
      volume_type="gp2"
    }
    user_data = "${file("webserver2_appach.sh")}"
}
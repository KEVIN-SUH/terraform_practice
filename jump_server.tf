resource "aws_instance" "jumpserver" {
  ami = "ami-068a0feb96796b48d"
  security_groups = [ "${aws_security_group.smaple_default.id}","${aws_security_group.bastion_Server.id}" ]
  key_name = aws_key_pair.key.key_name
  subnet_id = aws_subnet.public1.id
  instance_type = "t2.micro"
  associate_public_ip_address = false
  tags = {
    Name = "jumpserver"
  }
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }
}
resource "aws_eip" "jumpserver_ip" {
  vpc = true
  instance = aws_instance.jumpserver.id
  tags ={
    Name = "jumpserver_ip"
  }
}
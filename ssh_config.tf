data "template_file" "ssh_config" {
    template = file("./ssh_config.tmpl")
    vars={
        jumpserver_ip =aws_eip.jumpserver_ip.public_ip
        web01_private_ip=aws_instance.webserver1.private_ip
        web02_private_ip=aws_instance.webserver2.private_ip
    }
}
resource "local_file" "ssh_config" {
    content = data.template_file.ssh_config.rendered
    filename = "C:/Users/USER/.ssh/config"
  
}
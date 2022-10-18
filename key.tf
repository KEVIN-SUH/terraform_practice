resource "aws_key_pair" "key" {
    key_name = "KEVIN2"
    public_key = file("C:/Users/User/.ssh/KEVIN2.pub")
  
}
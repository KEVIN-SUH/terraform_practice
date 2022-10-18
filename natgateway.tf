resource "aws_nat_gateway" "nat1" {
    subnet_id = aws_subnet.public1.id
    allocation_id = aws_eip.eip_nat1.id
    tags = {
      Name = "nat-gw1"
    }
}
resource "aws_nat_gateway" "nat2" {
    subnet_id = aws_subnet.public2.id
    allocation_id = aws_eip.eip_nat2.id
    tags = {
      Name = "nat-gw2"
    }
}

resource "aws_eip" "eip_nat1" {
  vpc = true
}
resource "aws_eip" "eip_nat2" {
  vpc = true
}
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.sample-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw1.id
    }
    tags = {
      Name = "routetable_public1"
    }
}
resource "aws_route_table_association" "public1" {
  subnet_id = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public2" {
  subnet_id = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table" "private1" {
    vpc_id = aws_vpc.sample-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_eip.eip_nat1.id
    }
    tags = {
      Name = "routetable_public1"
    }
}
resource "aws_route_table" "private2" {
    vpc_id = aws_vpc.sample-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_eip.eip_nat2.id
    }
    tags = {
      Name = "routetable_public1"
    }
}
resource "aws_route_table_association" "private1" {
  subnet_id = aws_subnet.private1.id
  route_table_id = aws_route_table.private1.id
}
resource "aws_route_table_association" "private2" {
  subnet_id = aws_subnet.private2.id
  route_table_id = aws_route_table.private2.id
}
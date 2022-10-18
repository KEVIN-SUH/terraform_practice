resource "aws_subnet" "public1" {
    cidr_block = "10.0.0.0/20"
    vpc_id = aws_vpc.sample-vpc.id
    availability_zone = "ap-northeast-2a"
    tags = {
      Name = "public1"
    }
}
resource "aws_subnet" "public2" {
    cidr_block = "10.0.16.0/20"
    vpc_id = aws_vpc.sample-vpc.id
    availability_zone = "ap-northeast-2c"
    tags = {
      Name = "public2"
    }
}
resource "aws_subnet" "private1" {
    cidr_block = "10.0.64.0/20"
    vpc_id = aws_vpc.sample-vpc.id
    availability_zone = "ap-northeast-2a"
tags = {
      Name = "private1"
    }
}
resource "aws_subnet" "private2" {
    cidr_block = "10.0.80.0/20"
    vpc_id = aws_vpc.sample-vpc.id
    availability_zone = "ap-northeast-2c"
tags = {
      Name = "private1"
    }
}
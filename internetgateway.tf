resource "aws_internet_gateway" "igw1" {
    vpc_id = aws_vpc.sample-vpc.id
    tags = {
      Name = "igw1"
    }
  
}
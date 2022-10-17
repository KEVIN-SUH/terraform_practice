provider "aws" {
  region = "ap-northeast-2"
}
resource "aws_vpc" "practice_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "practice_vpc"
  }
}
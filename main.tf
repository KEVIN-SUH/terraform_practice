locals {
  json_data = jsondecode(file("./key.json"))
}
# json 파일 불러오는 형식 쓰고싶은 값을 local.json_data.## 으로 불러온다 
# 아마 data local_file { filename=jsondecode(file("path"))}도 될것같다
provider "aws" {
  region = "ap-northeast-2"
  access_key = local.json_data.access_key
  secret_key = local.json_data.secret_key
}
resource "aws_vpc" "practice_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "practice_vpc"
  }
}

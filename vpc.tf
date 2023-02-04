data "aws_vpc" "default" {
  default = true  
}

# data "aws_subnet_ids" "" {
#   vpc_id = 
# }

data "aws_subnets" "subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# resource "aws_route53_zone" "main" {
#   name = "tomiclouddev.com"
# }

# resource "aws_route53_zone" "terraform-test" {
#   name = "terraform-test.tomiclouddev.com"

#   tags = {
#     Environment = "terraform"
#   }
# }

# data "aws_network_interface" "lb" {
#   for_each = data.aws_subnets.subnet

#   filter {
#     name   = "description"
#     values = ["ELB ${aws_lb.publicalb.arn_suffix}"]
#   }

#   filter {
#     name   = "subnet-id"
#     values = [each.value]
#   }
# }

# resource "aws_route53_record" "terraform-a" {
#   zone_id = aws_route53_zone.main.zone_id
#   name    = "terraform-test.tomiclouddev.com"
#   type    = "A"
#   ttl     = "30"
#   records = data.aws_network_interface.lb[*].private_ip
# }
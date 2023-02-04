resource "aws_route53_zone" "main" {
  name = "tomidev.me"
}

resource "aws_route53_record" "terraform-test" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "terraform-test.tomidev.me"
  type    = "A"

  alias {
    name                   = aws_lb.publicalb.dns_name
    zone_id                = aws_lb.publicalb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www-terraform-test" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.terraform-test.tomidev.me"
  type    = "A"

  alias {
    name                   = aws_lb.publicalb.dns_name
    zone_id                = aws_lb.publicalb.zone_id
    evaluate_target_health = true
  }
}
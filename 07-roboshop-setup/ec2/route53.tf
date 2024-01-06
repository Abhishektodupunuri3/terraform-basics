resource "aws_route53_record" "component" {
  zone_id = "Z012404334BE8UZLTPE4P"
  name    = var.COMPONENT
  type    = "A"
  ttl     = 10
  records = [aws_spot_instance_request.spot_worker.private_ip]
} 
# Day 32

# create route53 records
resource "aws_route53_record" "www" {
  for_each = aws_instance.example
  zone_id  = var.zone_id
  name     = "${each.key}.${var.domain_name}" # mongodb.vardevops.online and . here is called as interpolation
  type     = "A"
  ttl      = 1
  records  = [each.value.private_ip]
  allow_overwrite = true
}


# create route53 records - lookup function
resource "aws_route53_record" "www" {
  for_each = aws_instance.example
  zone_id  = var.zone_id
  name    = "roboshop.${var.domain_name}"  # mongodb.vardevops.online and . here is called as interpolation
  type     = "A"
  ttl      = 1
  records  = [lookup(aws_instance.example,"frontend").public_ip]
  allow_overwrite = true
}

# Day 31

# create route53 records
resource "aws_route53_record" "www" {
  count   = length(var.instances)
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}"      # mongodb.vardevops.online and . here is called as interpolation
  type    = "A"
  ttl     = 1
  records = [aws_instance.loops[count.index].private_ip]
}

# roboshop.vardevops.online -> maps to public ip address using index function
resource "aws_route53_record" "www" {
  count   = length(var.instances)
  zone_id = var.zone_id
  name    = "roboshop.${var.domain_name}"      # mongodb.vardevops.online and . here is called as interpolation
  type    = "A"
  ttl     = 1
  records = [aws_instance.loops[index(var.instances,"frontend")].public_ip]
}

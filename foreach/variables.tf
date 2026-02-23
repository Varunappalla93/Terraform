# Day 32

# Map type
variable "instances" {
  type = map
  default = {
    mongodb : "t3.micro"
    redis     = "t3.micro"
    mysql     = "t3.small"
    rabbitmq  = "t3.micro"
    catalogue = "t3.micro"
  }
}

# list - should be converted to set
variable "instances2" {
  type = list
  default = ["user","shipping","frontend"]
}

variable "zone_id" {
  type    = string
  default = "Z07749522UFFTP3DDWVZQ"
}

variable "domain_name" {
  default = "vardevops.online"
}

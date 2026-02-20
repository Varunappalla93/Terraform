# Day 31

variable "instances" {
  type    = list(any)
  default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "shipping", "payment", "frontend"]
}


variable "zone_id" {
  type    = string
  default = "Z07749522UFFTP3DDWVZQ"
}

variable "domain_name" {
  default = "vardevops.online"
}



# list
variable "fruits_list" {
  type    = list(string) # allows duplicates, order is preserved
  default = ["apple", "banana","apple", "orange"]

}

# set
variable "fruits_set" {
  type    = set(string) # does not allow duplicates, order is not followed
  default = ["apple", "banana", "apple", "orange"]

}

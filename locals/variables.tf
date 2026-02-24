# Day 33

variable "name" {
  type = string
  default = "locals"
}


variable "env" {
  type = string
  default = "dev"
}


# variable "instance_names" {
#   type = string
#   default = "${var.name}-${var.env}"  # locals-dev
# }

# Variables may not be used here.


variable "ec2_tags" {
  default = {
    name="locals demo"
    Env="Prod"

  }
}

variable "sg_tags" {
  default = {
    name="locals demo"
    
  }
}
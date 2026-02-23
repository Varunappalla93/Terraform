# Day 32

variable "common_tags" {
  default = {
    project="Roboshop"
    Terraform="true"
    Env="Dev"
  }
}

variable "ec2_tags" {
  default = {
    name="functions demo"
    Env="Prod"

  }
}

variable "sg_tags" {
  default = {
    name="functions demo"
    
  }
}
# Day 31

# variables

variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "RHEL 9 Image"
}


variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "RHEL 9 Image"
}


variable "ec2-tags" {
  type = map(any)
  default = {
    Name        = "variables-demo"
    Project     = "roboshop"
    Terraform   = "True"
    Environment = "dev"
  }
}


variable "sg_name" {
  type    = string
  default = "allow-all-terraform-default"
}

variable "sg_description" {
  type    = string
  default = "Allow all inbound and outbound traffic"
}


variable "sg_from_port" {
  type    = number
  default = 0
}

variable "sg_to_port" {
  type    = number
  default = 0
}

variable "cidr_blocks" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  type = map(any)
  default = {
    Name        = "allow-all-terraform"
    Project     = "roboshop"
    Terraform   = "True"
    Environment = "dev"
  }
}

# Day 33

# locals are like variables with extra capabilities
# we cannot override local variables
# you can refer other variables inside locals
# can store functions/expressions inside locals

locals {
  instance_name = "${var.name}-${var.env}" # locals-dev
  instance_type = "t3.micro"
  common_tags = {
      project   = "Roboshop"
      Terraform = "true"
      Env       = "Dev"
    }
    ec2_final_tags=merge(local.common_tags,var.ec2_tags)
    ami_id=data.aws_ami.joindevops
  }

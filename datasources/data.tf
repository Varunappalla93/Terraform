# Day 32

# to query existing info from provider

data "aws_ami" "join-devops" {
  most_recent = true
  owners      = ["973714476881"]


  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# to get instance id and its state
data "aws_instance" "tf-instance" {
  filter {
    name   = "tag:Name"
    values = ["terraform"]
  }

  filter {
    name   = "instance-state-name"
    values = ["running"]
  }
}

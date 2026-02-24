# Day 33

# aws configure should be given first after aws cli v2 is downloaded in our machine.


resource "aws_instance" "example" {
  ami           = local.ami_id
  instance_type = local.instance_type
  vpc_security_group_ids = [aws_security_group.allow-ttls.id]

  tags = local.ec2_final_tags
}


resource "aws_security_group" "allow-ttls" {
  name        = "allow-all-terraform-remote-state" # this is for AWS account
  description = "Allow all inbound and outbound traffic"


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-all-terraform"

  }
}

# to execute :
# terraform init - downloads the infra
# terraform plan - plans but does not create infra
# terraform validate - to check syntax
# terraform apply or terraform apply -auto-approve - creates the infra
# terraform destroy -auto-approve - destroys the infra
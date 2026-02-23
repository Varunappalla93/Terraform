# Day 32

resource "aws_instance" "example" {
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-ttls.id]

  tags = {
    Name    = "terraform"
    Project = "Roboshop"
  }
}


resource "aws_security_group" "allow-ttls" {
  name        = "allow-all-terraform" # this is for AWS account
  description = "Allow all inbound and outbound traffic"


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # dynamic, here ingress is special variable, only for repated code inside resource
  dynamic "ingress" {
    # for_each = var.ingress_rules
    for_each = toset(var.ingress_rules) # list to set
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
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

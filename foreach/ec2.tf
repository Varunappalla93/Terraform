# Day 32

resource "aws_instance" "example" {
# for_each = var.instances # for map
for_each= toset(var.instances2) # for list to set
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"        # each.value for list
  vpc_security_group_ids = [aws_security_group.allow-ttls.id]

  tags = {
    Name    = each.key
    Project = "Roboshop"
  }
}


resource "aws_security_group" "allow-ttls" {
  name        = "allow-all-terraform" # this is for AWS account
  description = "Allow all inbound and outbound traffic"

# block
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

# block
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
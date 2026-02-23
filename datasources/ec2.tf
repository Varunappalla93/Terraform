# Day 32

# aws configure should be given first after aws cli v2 is downloaded in our machine.


resource "aws_instance" "example" {
  ami           = data.aws_ami.joindevops.id
  instance_type = "t3.micro"
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
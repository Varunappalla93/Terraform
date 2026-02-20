# Day 31

# create ec2 instances
resource "aws_instance" "loops" {
  count                  = length(var.instances)
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-ttls.id]

  tags = {
    Name    = var.instances[count.index]
    Project = "Roboshop"
  }
}

# create sg and attach to ec2 instance
resource "aws_security_group" "allow-ttls" {
  name        = "allow-all-roboshop" # this is for AWS account
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
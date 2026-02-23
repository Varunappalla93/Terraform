# Day 32

# functions -  we cannot do customize functions as we need to build from provider

# give as terraform console in terminal and use:
# max(10,20,30) -> 30
# endswith("Hello World","world") -> false
# join(" ", ["QA1","QA2"]) -> QA1 QA2
# lower("Varun") -> varun
# split(",", "QA1, QA2, QA3") -> ["QA1","QA2","QA3"]


resource "aws_instance" "example" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-ttls.id]

# merge
  tags = merge(var.common_tags,var.var.ec2_tags)
    
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

   tags = merge(var.common_tags,var.var.ec2_tags)
}
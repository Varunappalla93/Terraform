# Day 33

# aws configure should be given first after aws cli v2 is downloaded in our machine.


resource "aws_instance" "example" {
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-ttls.id]

  # self is special variable
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > inventory.ini"
  }

  provisioner "local-exec" {
    command = "exit 1"
    on_failure = continue
  }

  provisioner "local-exec" {
    command = "echo script-2"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Deleting the instance'"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo > inventory.ini"
  }

 connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo systemctl stop nginx"
    ]
    when = destroy
  }

  tags = {
    Name = "provisioners-demo"
    Project = "roboshop"
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

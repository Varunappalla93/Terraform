# Day 32

output "ami_id" {
  value = data.aws_ami.join-devops.id
}


output "instance_info" {
  value = data.aws_instance.tf-instance
}
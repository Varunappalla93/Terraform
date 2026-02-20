# Day 31

# to get public and private Ip address of instances for creating route53 records
output "roboshop_instances" {
    value = aws_instance.loops
    description = "description"
}

output "fruits_names_list" {
  value = var.fruits_list
}


output "fruits_names_set" {
  value = var.fruits_set
}
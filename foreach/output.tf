# Day 32

# get ec2 instances output
output "ec2_instance" {
  value = aws_instance.example
}


# terraform output -json > ec2_output.json - to get output in ec2_output.json file
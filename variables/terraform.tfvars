# Day 31

instance_type = "t3.small"
sg_name= "allow-all-terraform-tfvars"

# terraform variables precedence:
# 1)First it will take from command line args -> give terraform plan -var="sg_name"="allow-all-from-cmd-line"

# 2)Now give terraform plan and next it will take from terraform.tfvars file

# 3) Now comment sg_name from terraform.tfvars file and give export TF_VAR_sg_name="allow-all-env-variables" and give terraform plan
#  and next it will take from env variables

# 4) Now give unset TF_VAR_sg_name and give terraform plan and next it will take from default sg_name value inside variables.tf file
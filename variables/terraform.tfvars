# Day 31

instance_type = "t3.small"
sg_name= "allow-all-terraform-tfvars"

# variables precedence:
# 1)command line args -> terraform plan -var="sg_name"="allow-all-from-cmd-line"
# 2)inside terraform.tfvars file
# 3)default values inside variables.tf
# 4)env variables -> set TF_VAR_sg_name="allow-all-env-variables
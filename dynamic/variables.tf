# Day 32

variable "ingress_rules" {
  default = [
    {
      port        = 22
      cidr_blocks = ["0.0.0.0/0"]
      description = "allowing port no 22 from internet"
    },
    {
      port        = 3306
      cidr_blocks = ["0.0.0.0/0"]
      description = "allowing port no 3306 from internet"
    },
    {
      port        = 443
      cidr_blocks = ["0.0.0.0/0"]
      description = "allowing port no 443 from internet"
    },
  ]
}

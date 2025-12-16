variable "VPC_cidr_block" {
  description = "CIDR Block of VPC"
  type        = string
  default = "10.0.0.0/16"
}

locals {
  tags = "My-Project-Module"
}

variable "ami_id" {
  type    = string
  default = "ami-02b8269d5e85954ef"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "subnets" {
  type = map(object({
    cidr_block = string
    public     = bool
  }))

  default = {
    subnet1 = {
      cidr_block = "10.0.0.0/24"
      public     = true
    }
    subnet2 = {
      cidr_block = "10.0.1.0/24"
      public     = false
    }
  }
}


locals {
  public_subnet_id = one([
    for k, v in aws_subnet.subnet : v.id
    if var.subnets[k].public == true
  ])
}

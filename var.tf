variable "AMI_ID" {
    type = string
    description = "AMI_ID"
    default = "ami-0149b2da6ceec4bb0"
}

variable "INSTANCE_TYPE" {
    type = string
    description ="type of EC2 intance"
    default = "t2.micro"
}
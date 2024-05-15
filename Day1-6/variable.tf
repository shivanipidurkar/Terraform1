variable "ami_id" {
    description = "passing ami value to main.tf"
    type = string
    default = "ami-04e5276ebb8451442"
}
variable "instace_type" {
    type = string
    default = "t2.micro"
  
}
  
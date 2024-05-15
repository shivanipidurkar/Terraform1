data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}





data "aws_security_group" "dev" {
    id = "sg-036caae4e136d8399"
  
}
data "aws_subnet" "dev" {
    id = "subnet-05312bd2a35ac90ab"
  
}
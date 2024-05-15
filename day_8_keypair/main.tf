provider "aws" {
    region = "ap-south-1"
  
}
resource "aws_key_pair" "example" {
  key_name   = "key"  # Replace with your desired key name
  public_key = file("~/.ssh/id_rsa.pub") 


}

resource "aws_instance" "dev" {
    ami = "ami-013e83f579886baeb"
    instance_type = "t2.micro"
    key_name = aws_key_pair.example.key_name
    tags = {
      Name ="keypair"
    }
  
}
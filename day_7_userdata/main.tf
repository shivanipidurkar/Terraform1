provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_instance" "web" {
  ami                    = "ami-013e83f579886baeb"      #change ami id for different region
  instance_type          = "t2.micro"
  key_name               = "keyv"              #change key name as per your setup
  user_data              = file("test.sh") # define your path and file name 
     
  tags = {
    Name = "project-MainEc2"
  }
}
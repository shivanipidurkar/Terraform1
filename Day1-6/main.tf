#Instance Creation
resource "aws_instance" "EC2" {
  ami = data.aws_ami.amzlinux.id
  instance_type = var.instace_type
  key_name = "keyname"
  subnet_id = data.aws_subnet.dev.id
  associate_public_ip_address =  true
  security_groups = [data.aws_security_group.dev.id]

  tags = {
    Name = "EC2_instance"

  }
}
#create vpc
resource "aws_vpc" "dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name= "dev"
  }
}
#create IG and attach to vpc
resource "aws_internet_gateway" "dev" {
  vpc_id = aws_vpc.dev.id
  
}

#create subnet
resource "aws_subnet" "dev" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.dev.id
  
}

#create route table and attach IG to RT
resource "aws_route_table" "dev" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev.id
    
  } 
}

#subnet Association
resource "aws_route_table_association" "dev" {
  route_table_id = aws_route_table.dev.id
  subnet_id = aws_subnet.dev.id
  
}
//s3 bucket
resource "aws_s3_bucket" "asdfgtr" {
    bucket = "fhsyenf"
    depends_on = [aws_instance.EC2]
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}
/*
# Security group

resource "aws_security_group" "dev" {
  name        = "allow_tls"
  vpc_id      = aws_vpc.dev.id
  tags = {
    Name = "dev_sg"
  }
 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
}*/
provider "aws" {
  region = "us-east-2"
}

# resource "provider_type" "name" {
# config...
#}

resource "aws_instance" "EC2instance"{
  ami = "ami-0fb653ca2d3203ac1" #this is the image you can create with docker
  instance_type = "t2.micro" 
  
  tags{
    Name = "nameoftheEC2"
  }
}


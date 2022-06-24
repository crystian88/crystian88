provider "aws" {
  region = "us-east-2"
}

# resource "provider_type" "name" {
# config...
#}

resource "aws_instance" "EC2instance"{
  ami = "ami-0fb653ca2d3203ac1" #this is the image you can create with docker
  instance_type = "t2.micro" 
  vpc_security_group_ids = [aws_security_group.instance.id] #it tells to apply the policy
  
  user_data = <<-EOF    #EOF are used to create multiline instead of inserting \n
              #!/bin/bash
			  echo "Hello, World" > index.html
			  nohup busybox httpd -f -p 8080 &
			  EOF
  
  tags{
    Name = "nameoftheEC2"
  }
}

resource "aws_security_group" "Instance"{
  name = "security-group-for-instance"
  
  ingress{
    from_port = 8080
	to_port = 8080
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"] #all IP addresses
  }
}



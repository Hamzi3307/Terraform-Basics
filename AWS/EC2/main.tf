# Launching a simple Instance using terraform

resource "aws_instance" "webserver" {
    ami = "ami-0e5f882be1900e43b"
    instance_type = "t2.micro"
    tags = {
      "Name" = "WebServer"
    }
    user_data = <<EOF
    #!/bin/bash
    apt update -y && apt install nginx -y
    systemctl start nginx && systemctl enable nginx 
    EOF
    key_name = aws_key_pair.publicKey.id
    vpc_security_group_ids = [aws_security_group.SSH.id]
}

resource "aws_key_pair" "publicKey" {
  public_key = file("~/.ssh/ssh-backend-atif.pub")
}

resource "aws_security_group" "SSH" {
  name = "SSHAccess"
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

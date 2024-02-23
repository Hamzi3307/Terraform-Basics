resource "aws_instance" "nginx" {
  ami = "ami-7y734h732y23r32"
  instance_type = "t2.micro"
  provisioner "remote-exec" {
    inline = [ 
        "sudo apt update -y",
        "sudo apt install nginx -y",
        "sudo systemctl start nginx",
        "sudo systemctl enable nginx"
    ]
  }
  connection {
    type = "ssh",
    host = self.public_ip,
    user = "ubuntu",
    private_key = "~/.ssh/key.pem"
  }
  key_name = aws_key_pair.publicKey.id
  vpc_security_group_ids = aws_security_group.SSH.id
}

resource "aws_key_pair" "publicKey" {
  public_key = file("~/.ssh/key.pub")
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

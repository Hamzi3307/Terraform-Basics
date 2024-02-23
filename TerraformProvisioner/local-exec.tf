resource "aws_instance" "nginx" {
  ami = "ami-7y734h732y23r32"
  instance_type = "t2.micro"
  provisioner "local-exec" {
    on_failure = fail
    when = create
    command = "echo Instance: ${aws_instance.nginx.public_ip} Created. > /tmp/ip.txt"
  }
  provisioner "local-exec" {
    when = destroy
    on_failure = continue
    command = "echo Instance: ${aws_instance.nginx.public_ip} Destroyed. > /tmp/ip.txt"
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
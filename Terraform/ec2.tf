resource "aws_instance" "web" {
  ami             = "ami-04505e74c0741db8d"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.ec2-key-pair.key_name
  security_groups = [aws_security_group.allow_ssh.id]
  subnet_id       = "subnet-32af2d03"

  tags = {
    Name = "HelloWorld"
  }
}
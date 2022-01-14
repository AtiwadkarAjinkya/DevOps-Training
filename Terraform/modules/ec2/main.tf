resource "aws_instance" "Demo_ec2" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id = "subnet-0b0c0246"
  key_name = var.key_name

  tags = {
    Name = "Test_ec2"
    CreatedBy = "Terraform"
  }
}
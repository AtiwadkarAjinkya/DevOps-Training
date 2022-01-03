terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.70.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "terraform-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}

data "aws_ami" "ubuntu_ami" {

    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}




resource "aws_instance" "Demo_ec2" {
  ami           = data.aws_ami.ubuntu_ami.image_id
  instance_type = "t2.micro"
  subnet_id = "subnet-0b0c0246"
  key_name = aws_key_pair.deployer.key_name

  tags = {
    Name = "Test_ec2"
    CreatedBy = "Terraform"
  }
}

resource "aws_instance" "test" {
  ami = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
}
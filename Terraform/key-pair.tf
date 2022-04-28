resource "aws_key_pair" "ec2-key-pair" {
  key_name   = "${terraform.workspace}-Macbook"
  public_key = file("~/.ssh/id_ed25519.pub")
}
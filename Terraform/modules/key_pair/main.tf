resource "aws_key_pair" "deployer" {
  key_name   = "terraform-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}

output "key" {
  value = aws_key_pair.deployer.key_name
}
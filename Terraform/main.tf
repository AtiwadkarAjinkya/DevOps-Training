module "data" {
  source = "./modules/data"
}

module "key_pair" {
  source = "./modules/key_pair"
}

module "ec2" {
  source = "./modules/ec2"
  ami_id = module.data.ami_id
  key_name = module.key_pair.key
}
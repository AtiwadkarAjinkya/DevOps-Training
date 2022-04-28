terraform {
  backend "s3" {
    bucket         = "b7012-terraform-backend"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    profile        = "TiW"
    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  required_version = "~> 0.12.9"

  backend "s3" {
    bucket = "k-masatany-terraform-backend"
    key    = "terraform-sample-02.tfstate"
    region = "ap-northeast-1"
  }
}

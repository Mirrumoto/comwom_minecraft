terraform {
  backend "s3" {
    bucket = "tfstate-usw2"
    key    = "usw2-minecraft-01/tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region  = "us-east-1"
}


module "minecraft" {
  source = "./minecraft"

  name        = "use1"
  namespace   = "minecraft"
  environment = "prod"

  vpc_id    = "vpc-06c0630b0405fac24"
  subnet_id = "subnet-08c770d4cf25cb033"

  bucket_name = "use1-games-minecraftbackups"

  ami      = "ami-002f3ac4cb4be3596"
  key_name = "wlauth-use1-p"

  instance_type = "t4g.medium"

  mc_port        = 25565
  mc_root        = "/home/mc"
  mc_version     = "latest"
  mc_backup_freq = 10

  java_ms_mem = "4G"
  java_mx_mem = "4G"
}

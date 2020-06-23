variable "profile" {
  default = "default"
}

variable "region" {
  default = "cn-beijing"
}

provider "alicloud" {
  region  = var.region
  profile = var.profile
}

module "create_resource_directory_example" {
  source                    = "../.."
  create_resource_directory = true
  region                    = var.region
  profile                   = var.profile
}
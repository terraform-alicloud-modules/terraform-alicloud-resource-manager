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

module "create_resource_group_example" {
  source                = "../.."
  create_resource_group = true
  region                = var.region
  profile               = var.profile

  resource_groups = [
    {
      name         = "production"
      display_name = "production_group"
    },
    {
      name         = "develop"
      display_name = "develop_group"
    }
  ]
}

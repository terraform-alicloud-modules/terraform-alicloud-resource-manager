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

# Create folder, account and handshake base on existing resource directory
data "alicloud_resource_manager_resource_directories" "this" {}

locals {
  root_folder_id = data.alicloud_resource_manager_resource_directories.this.directories.0.root_folder_id
}

module "create_resource_example" {
  source  = "../.."
  region  = var.region
  profile = var.profile

  #########################s
  # Create Folder
  #########################
  create_folder    = true
  parent_folder_id = local.root_folder_id
  folder_names     = ["test_1", "test_2"]

  #########################
  # Create Account
  #########################
  create_account        = true
  folder_id             = module.create_resource_example.folder_id[0]
  account_display_names = ["account_1", "account_2"]

  #########################
  # Create Handshake
  #########################
  create_handshake = true
  handshakes = [
    {
      target_entity = "1182775234******"
      target_type   = "Account"
      note          = "test resource manager handshake"
    },
  ]
}
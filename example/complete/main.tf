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

module "resource_group_complete_example" {
  source = "../.."

  #########################
  # Create Resource Group
  #########################
  create_resource_group = true
  resource_groups = [
    {
      name         = "tf-test"
      display_name = "tf-test"
    },
    {
      name         = "tf-test2"
      display_name = "tf-test2"
    },
  ]

  #########################
  # Create Policy
  #########################
  create_policy = true
  custom_policies = [
    {
      policy_name     = "test_policy"
      description     = "policy for test"
      policy_document = <<EOF
              {
            "Statement": [{
                "Action": ["oss:*"],
                "Effect": "Allow",
                "Resource": ["acs:oss:*:*:*"]
            }],
            "Version": "1"
        }
    EOF
    },
  ]

  #########################
  # Create Role
  #########################
  create_role = true
  roles = [
    {
      role_name                   = "tf-role"
      description                 = "test role"
      max_session_duration        = "3600"
      assume_role_policy_document = <<EOF
     {
          "Statement": [
               {
                    "Action": "sts:AssumeRole",
                    "Effect": "Allow",
                    "Principal": {
                        "RAM":["acs:ram::10440897********:root"]
                    }
                }
          ],
          "Version": "1"
     }
     EOF
    },
  ]

  #########################
  # Create Resource Directory
  #########################
  create_resource_directory = true

  #########################s
  # Create Folder
  #########################
  create_folder = true
  folder_names  = ["test_1", "test_2"]

  #########################
  # Create Account
  #########################
  create_account        = true
  folder_id             = module.resource_group_complete_example.folder_id[0]
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
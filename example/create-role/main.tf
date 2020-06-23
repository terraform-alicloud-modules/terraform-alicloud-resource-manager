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

module "create_role_example" {
  source      = "../.."
  region      = var.region
  profile     = var.profile
  create_role = true

  roles = [
    {
      role_name                   = "role"
      description                 = "test role"
      max_session_duration        = "3600"
      assume_role_policy_document = <<EOF
     {
          "Statement": [
               {
                    "Action": "sts:AssumeRole",
                    "Effect": "Allow",
                    "Principal": {
                        "RAM":[
                                "acs:ram::10375546********:root",
                                "acs:ram::10440897********:root"
                        ]
                    }
                }
          ],
          "Version": "1"
     }
     EOF
    },
  ]
}
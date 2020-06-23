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

module "create_policy_example" {
  source        = "../.."
  create_policy = true

  custom_policies = [
    {
      policy_name     = "test_policy1"
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
    {
      policy_name     = "test_policy2"
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
    }
  ]
}
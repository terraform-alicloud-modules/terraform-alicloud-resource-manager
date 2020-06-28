# terraform-alicloud-resource-manager

Terraform Module for building resource manager services on Alibaba Cloud, like resource group, account, role and so on.

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-resource-manager/blob/master/README-CN.md)

These types of resources are supported:

* [alicloud_resource_manager_resource_group](https://www.terraform.io/docs/providers/alicloud/r/resource_manager_resource_group.html)
* [alicloud_resource_manager_policy](https://www.terraform.io/docs/providers/alicloud/r/resource_manager_policy.html)
* [alicloud_resource_manager_role](https://www.terraform.io/docs/providers/alicloud/r/resource_manager_role.html)
* [alicloud_resource_manager_resource_directory](https://www.terraform.io/docs/providers/alicloud/r/resource_manager_resource_directory.html)
* [alicloud_resource_manager_folder](https://www.terraform.io/docs/providers/alicloud/r/resource_manager_folder.html)
* [alicloud_resource_manager_account](https://www.terraform.io/docs/providers/alicloud/r/resource_manager_account.html)
* [alicloud_resource_manager_handshake](https://www.terraform.io/docs/providers/alicloud/r/resource_manager_handshake.html)

## Terraform versions

This module requires Terraform 0.12 and Terraform Provider Alicloud 1.86.0+.

## Usage

### For new resource group

```hcl
module "create_resource_group_example" {
  source                = "terraform-alicloud-modules/resource-manager/alicloud"
  region                = "cn-beijing"
  profile               = "Your-Profile-Name"
  create_resource_group = true

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
```

### Create folder, account and handshake base on existing resource directory

```hcl
data "alicloud_resource_manager_resource_directories" "this" {}

locals {
  root_folder_id = data.alicloud_resource_manager_resource_directories.this.directories.0.root_folder_id
}

module "create_resource_example" {
  source                = "terraform-alicloud-modules/resource-manager/alicloud"
  region                = "cn-beijing"
  profile               = "Your-Profile-Name"

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
```

## Examples

More usage reference examples.

* [complete](https://github.com/terraform-alicloud-modules/terraform-alicloud-resource-manager/tree/master/examples/complete)
* [create-resource-group](https://github.com/terraform-alicloud-modules/terraform-alicloud-resource-manager/tree/master/examples/create-resource-group)
* [create-policy](https://github.com/terraform-alicloud-modules/terraform-alicloud-resource-manager/tree/master/examples/create-policy)
* [create-role](https://github.com/terraform-alicloud-modules/terraform-alicloud-resource-manager/tree/master/examples/create-role)
* [create-resource-directory](https://github.com/terraform-alicloud-modules/terraform-alicloud-resource-manager/tree/master/examples/create-resource-directory)
* [create-resource-base-on-existing-resource-directory](https://github.com/terraform-alicloud-modules/terraform-alicloud-resource-manager/tree/master/examples/create-resource-base-on-existing-resource-directory)

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`.
If you have not set them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

* An enterprise authentication account is required to create a resource directory. Once the resource directory is created, it cannot be destroyed by `terraform destory`.

* The account currently does not support destruction by terraform, and can only be moved to other resource folders in the console.

## Submit Issues

If you have any problems when using this module, please opening a [Provider Issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new) and let us know.

Note: There does not recommend to open an issue on this repo.

## Authors

Created and maintained by Liu ri(liuri2285@gmail.com), He Guimin(@xiaozhu36, heguimin36@163.com).

## License

Apache 2 Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)


# terraform-alicloud-resource-manager

本 Module 用于在阿里云创建资源管理的相关资源，如资源组，权限策略，角色，资源目录，资源夹，资源账号和邀请等。

本 Module 支持创建以下资源:

* [阿里云资源管理资源组](https://www.terraform.io/docs/providers/alicloud/r/resource_manager_resource_group.html)
* [阿里云资源管理权限策略](https://www.terraform.io/docs/providers/alicloud/r/resource_manager_policy.html)
* [阿里云资源管理角色](https://www.terraform.io/docs/providers/alicloud/r/resource_manager_role.html)
* [阿里云资源管理资源目录](https://www.terraform.io/docs/providers/alicloud/r/resource_manager_resource_directory.html)
* [阿里云资源管理资源夹](https://www.terraform.io/docs/providers/alicloud/r/resource_manager_folder.html)
* [阿里云资源管理账号](https://www.terraform.io/docs/providers/alicloud/r/resource_manager_account.html)
* [阿里云资源管理邀请](https://www.terraform.io/docs/providers/alicloud/r/resource_manager_handshake.html)

## Terraform 版本

本模板要求使用版本 Terraform 0.12 和阿里云 Provider 1.86.0+。

## 用法
    
#### 创建资源组

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

### 在已开通的资源目录下创建资源夹，账号和邀请

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

## 示例

更多的用法请参考模板中的示例。

* [资源管理所有资源完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-resource-manager/tree/master/examples/complete)
* [创建资源组](https://github.com/terraform-alicloud-modules/terraform-alicloud-resource-manager/tree/master/examples/create-resource-group)
* [创建权限策略](https://github.com/terraform-alicloud-modules/terraform-alicloud-resource-manager/tree/master/examples/create-policy)
* [创建角色](https://github.com/terraform-alicloud-modules/terraform-alicloud-resource-manager/tree/master/examples/create-role)
* [创建资源目录](https://github.com/terraform-alicloud-modules/terraform-alicloud-resource-manager/tree/master/examples/create-resource-directory)
* [在开通的资源目录中创建资源](https://github.com/terraform-alicloud-modules/terraform-alicloud-resource-manager/tree/master/examples/create-resource-base-on-existing-resource-directory)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file` 中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置。

* 开通资源目录需要经过企业认证的账号方可开通成功，资源目录一旦创建不支持通过 `terraform destroy` 命令删除。

* 资源账号目前不支持删除操作，只支持在控制台中移动到其他资源夹。

## 提交问题
如果在使用该 Terraform Module 的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

注意: 不建议在该 Module 仓库中直接提交 Issue。

## 作者
Created and maintained by Liu ri(liuri2285@gmail.com), He Guimin(@xiaozhu36, heguimin36@163.com)。

## 许可
Apache 2 Licensed. See LICENSE for full details。

## 参考 
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)

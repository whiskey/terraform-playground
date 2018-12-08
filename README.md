# Terraform common modules playground

This is just a playground to try out certain Terraform resources and pack them into custom modules. Although some care is put into this code production usage is discouraged.

[Terraform's own AWS modules](https://github.com/terraform-aws-modules) are highly recommended!


## Initial setup

It's recommended to use an init file for the current S3 backend: `terraform init -backend-config=backend_config`.  

## Caveats

* Simple setup; has rough edges!
* Variables are handled locally, no centralized configuration management such as _Vault_ is used.
* Currently no testing in place
* [Issues](https://github.com/terraform-providers/terraform-provider-aws/issues/2468#issuecomment-352728235) with RDS updates


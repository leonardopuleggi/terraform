# Module

## Use

First init then you can use the module

```
terraform init
terraform plan
```

## Module reference

Unique names

Variables can be passed as input

```
# modules must have unique names
module "web_1" {
  source = "./app-module"

  # Input Variables
  app_name         = "web-app-1"
  environment_name = "production"
  server_name      = "server1"
  secret_value     = var.value_to_show
}

```

Output must be re-exported 

```
output "public_ip_node1" {
  value = try(module.web_1.public_ip, null)
}
```

## Sensitive data

```
variable "secret_value" {
  description = "Secret value to show on the Public IP - not really secret - just to show that it is passed from the main module to the child module"
  type        = string
  sensitive   = true
}
```
Use inside a user-data script

```
data "template_file" "init" {
  template = "${file("app-module/userdata.sh")}"

  vars = {
    secret_value = "${var.secret_value}"
  }
}

user_data              = "${data.template_file.init.rendered}"
```


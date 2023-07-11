# Variables, locals, output and 

## Locals - local variables

Avoid duplication in the same module

Think as local variable in code

```
locals {
  variable1 = "variable1"
  variable2 = "variable2"
}

resource "aws_instance" "instance" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name     = var.instance_name
    Tag1 = local.variable1
  }
}

```

## Variables 

Defined in variables.tf

Can be overriden by -var command line, passing terraform.tfvar from file system (i.e. to store )

```
# 02_variables_output/variables.tf

variable "environment" {
  description = "environment"
  type        = string
  default     = "dev"
}
```

We can have different types, map, bool, list

```
variable "zones" {
  type = map
  default = {
    "amsterdam" = "nl-ams1"
    "london"    = "uk-lon1"
  }
}

variable "set_password" {
  type = bool
  default = false
}

variable "users" {
  type = list
  default = ["root", "user1", "user2"]
}
```

Use them like

```
  zone = var.zones["amsterdam"]
  
  # Number of CPUs and memory in GB
  plan = var.plans[var.plan]

  template {
  # OS root disk size
  size = lookup(var.storage_sizes, var.plans[var.plan])
```

## Output

Output parameters from the resource creation

Think as return values

```
output "instance_1_ip_addr" {
  value = aws_instance.instance.public_ip
}
```




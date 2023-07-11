# Multiple accounts

We can either use a folder structure to represent the various environments/accounts

## Workspace

Create a workspace and then use a variable <b>terraform.workspace</b> in the code

> Error prone as devops engineers needs to remember which env they are working on
> One state per environment - Terraform creates a dir structure for each workspace.


```
terraform workspace new dev
terraform workspace new staging
terraform workspace new prod
terraform workspace list
terraform workspace select dev
```

Count and tags based on the environment

```
resource "aws_instance" "instance" {
  ami           = "ami-06464c878dbe46da4"
  instance_type = "t3.micro"
  count         =  "${terraform.workspace == "prod" ? 3 : 1}"
  
  tags = {
    Name = format("%s_%s", var.name_tag, terraform.workspace)
    Environment = terraform.workspace
  }
}
```

## Directory structure

We have the same infrastructure in common files but have different terraform.tfvars in each environment. This is not ideal when you have the different infrastructure in all environments.

Use tfvars to keep the specific config values for each environment


```
cd common
terraform init
terraform apply  

cd dev
terraform init
terraform apply --var-file="dev.tfvars"

cd prod
terraform init
terraform apply --var-file="prod.tfvars"

cd prod
terraform destroy --var-file="prod.tfvars"

cd common
terraform destroy 
```

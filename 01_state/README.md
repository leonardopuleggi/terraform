# Remote backends

To work with multiple engineers we need to move the Terraform state from local to cloud (i.e. AWS S3 and DynamoDB)

S3 contains state
DynamoDB handles locking between different apply

1) Execute first with local state - set a unique S3 name in variables.tf
```
terraform init
terraform apply -auto-approve
```

2) Check in AWS console for the S3 bucket. The S3 bucket is present but empty
3) Uncomment the backend part. Update the backend part as you did with the variables (if). Execute terraform init again. Confirm that yoy want to move from local to an empty S3
```
terraform init
```
5) Plan to check if the state and the AWS resources are in sync

```
terraform plan
```

6) Eventually remove the TF state and AWS resources. Comment again the backend part. Ask to migrate to a local backend (confirm) and then destroy

```
terraform init -migrate-state
terraform destroy
```


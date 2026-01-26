# Cludformation Templates

Collection of cloudformation templates -- can be referenced when deploying basic resources.

## Usage

These templates can be deployed using the rain cli [https://github.com/aws-cloudformation/rain](https://github.com/aws-cloudformation/rain)

```sh
$ rain deploy template.yml efs-99 -y
Deploying template 'template.yml' as stack 'efs-99' in eu-central-1.
Stack efs-99: CREATE_IN_PROGRESS - 2 resources pending, 4 resources in progress
·˙. 24s 
```

## Parameters

Some parameters in these templates are hard coded or have default values associated with my AWS account, especially VPC and Subnet IDs. These would have to be changed when using a different account

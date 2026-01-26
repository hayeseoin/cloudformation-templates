# Load Balancer, Route53 and ACM

Deploys a stack with a VPC, an EC2 Autoscaling group, an Application Load Balancer, a domain and a certificate for that domain. 

A Route53 Hosted Zone must already be set up, and the domain name must be in that hosted zone. The certificate will be provisioned automatically. 

## Example command
```sh
rain deploy template.yml r53-97 --params=HostedZoneId=Z03310311U3CW2UTB434H,DomainName=r53-97.aws-test.nhay.es
```

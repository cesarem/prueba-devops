# Prueba Devops - Cesar Amaya
[Terraform](https://www.terraform.io/) configuration that deploys a cluster of 2 web servers
(using [EC2](https://aws.amazon.com/ec2/) and [Auto Scaling](https://aws.amazon.com/autoscaling/)) and an application load balancer
(using [ELB](https://aws.amazon.com/elasticloadbalancing/)) in an [Amazon Web Services (AWS)
account](http://aws.amazon.com/). The load balancer listens on port 80 and returns the default apache2 index web page for the
`/` URL.

## Pre-requisites

* You must have [Terraform](https://www.terraform.io/) installed on your computer.
* You must have [Packer](https://www.packer.io/) installed on your computer.
* You must have an [Amazon Web Services (AWS) account](http://aws.amazon.com/).

Please note that this code was written for Terraform 0.12.x.

## Quick start

**Please note that this example will deploy real resources into your AWS account. We have made every effort to ensure
all the resources qualify for the [AWS Free Tier](https://aws.amazon.com/free/), but we are not responsible for any
charges you may incur.**

Configure your [AWS access keys](http://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys) as
environment variables:

```
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```
Build the [Amazon Machine Image](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html) using Packer
```
packer build webserver.json
```

Deploy the code:

```
terraform init
terraform apply
```

When the `apply` command completes, it will output the DNS name of the load balancer. To test the load balancer:

```
curl http://<alb_dns_name>/
```

Clean up when you're done:

```
terraform destroy
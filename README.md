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

Configure your [AWS access keys](http://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys) as
environment variables:

```
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```
Build the [Amazon Machine Image](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html) using [Packer](https://www.packer.io/)
```
packer build webserver.json
.
.
.
==> Builds finished. The artifacts of successful builds are:
--> amazon-ebs: AMIs were created:
us-east-2: ami-01bd654d746a97ad2
```

Deploy the code:

```
terraform init
terraform apply

<<Enter the image id given by Packer>>
var.ami_id
  Image ID

  Enter a value: ami-01bd654d746a97ad2
```

When the `apply` command completes, it will output the DNS name of the load balancer. To test the load balancer:

```
curl http://<alb_dns_name>/
```

Clean up when you're done:

```
terraform destroy
# What is it

VPC spread across 2 AZs with private and public subnets.

Private zone in route53 for internal name resolution, service discovery via cloud map.

Application load balancer for UI access

EFS for JENKINS_HOME with an access point and mountpoints in both AZs, data encrypted at rest and in transit

EFS for latestbuilds configured similarly

ECS cluster backed by autoscaling group of EC2 instances

Jenkins master service and task.

Profiledata service and task, data populated from SSM

Worker task generator - workers pull profiledata key from SSM and sync data from profiledata container

Latestbuilds container (currently only http)

Go proxy container

A bastion instance with ssh access locked down to the creator's IP address.

# What's broken

The latestbuilds task is currently pointing at a basic nginx container. The EFS volume exists and is mounted in the container at /latestbuilds, but nothing is happening with it yet.

There's some ping-ponging of the security group rule which gives the bastion host ssh access to the private instances - terraform apply seems to switch it on then off then on then off etc. Not sure why, not been annoyed enough by it to prioritize fixing it yet.

Creating packages.couchbase.com endpoint is manual just now, see: https://discuss.hashicorp.com/t/how-to-register-service-instance-to-cloud-map-namespace/11384/3

# Quick Start

Change `name` in `vars.tf` to something unique, it's used as a prefix when naming various resources.

```
export AWS_ACCESS_KEY_ID=[your key]
export AWS_SECRET_ACCESS_KEY=[your secret]

terraform apply
```

You'll be able to access jenkins via the URL in the terraform output once it completes, the container is streaming its logs to a cloudwatch log group so you can get the initial password there (latestbuilds and the agents do the same with their logs)

Once everything is up, use the bastion_instance_ssh output string from the terraform output to connect to the bastion host, after it's been up a couple of minutes it'll create /efs and mount the jenkins_home and latestbuilds volumes there. Edit /efs/jenkins_home/config.xml when available and replace or add the `clouds` terraform output snippet to the clouds section.

With the config added, install the ECS plugin in Jenkins. After Jenkins is restarted, you'll be able to point jobs at the tags associated with the container tasks - you can see them all in files/jenkins/clouds.tpl, e.g `<label>master-amzn2</label>`

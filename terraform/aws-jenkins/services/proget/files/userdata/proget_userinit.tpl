#!/bin/bash
set -x
ec2_id="`wget -q -O - http://169.254.169.254/latest/meta-data/instance-id || die \"wget instance-id has failed: $?\"`"
ec2_ip="`wget -q -O - http://169.254.169.254/latest/meta-data/local-ipv4 || die \"wget local-ipv4 has failed: $?\"`"

#to-do: enhence this to use "aws servicediscovery get-service" to find service id
aws servicediscovery register-instance --service-id srv-pwxkawsumuqeaauu --instance-id $ec2_id --attributes=AWS_INSTANCE_IPV4=$ec2_ip --region us-east-1

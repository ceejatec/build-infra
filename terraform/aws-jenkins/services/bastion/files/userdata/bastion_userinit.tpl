#!/bin/bash
sleep 120

sudo su - root

# Install AWS EFS Utilities
yum install -y amazon-efs-utils

mkdir /efs/latestbuilds
chown 1000:1000 /efs/latestbuilds

mkdir -p /efs/jenkins_home/{analytics,cv,server}
chown 1000:1000 /efs/jenkins_home/{analytics,cv,server}

echo "mount -t efs -o iam,tls,accesspoint=${analytics_jenkins_accesspoint} ${filesystem}: /efs/jenkins_home/analytics" > /root/mount.sh
echo "mount -t efs -o iam,tls,accesspoint=${cv_jenkins_accesspoint} ${filesystem}: /efs/jenkins_home/cv" >> /root/mount.sh
echo "mount -t efs -o iam,tls,accesspoint=${server_jenkins_accesspoint} ${filesystem}: /efs/jenkins_home/server" >> /root/mount.sh

echo "mount -t efs -o iam,tls,accesspoint=${latestbuilds_accesspoint} ${filesystem}: /efs/latestbuilds" >> /root/mount.sh

chmod a+x /root/mount.sh
/root/mount.sh
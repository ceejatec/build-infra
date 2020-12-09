#!/bin/bash
sleep 120

sudo su - root

# Install AWS EFS Utilities
yum install -y amazon-efs-utils

mkdir -p /efs/latestbuilds
chown 1000:1000 /efs/latestbuilds

mkdir -p /efs/downloads
chown 1000:1000 /efs/downloads

mkdir -p /efs/nexus
chown 1000:1000 /efs/nexus

mkdir -p /efs/jenkins_home/{analytics,cv,server,mobile}
chown 1000:1000 /efs/jenkins_home/{analytics,cv,server,mobile}

echo "mount -t efs -o iam,tls,accesspoint=${analytics_jenkins_accesspoint} ${filesystem}: /efs/jenkins_home/analytics" > /root/mount.sh
echo "mount -t efs -o iam,tls,accesspoint=${cv_jenkins_accesspoint} ${filesystem}: /efs/jenkins_home/cv" >> /root/mount.sh
echo "mount -t efs -o iam,tls,accesspoint=${server_jenkins_accesspoint} ${filesystem}: /efs/jenkins_home/server" >> /root/mount.sh
echo "mount -t efs -o iam,tls,accesspoint=${mobile_jenkins_accesspoint} ${filesystem}: /efs/jenkins_home/mobile" >> /root/mount.sh

echo "mount -t efs -o iam,tls,accesspoint=${latestbuilds_accesspoint} ${filesystem}: /efs/latestbuilds" >> /root/mount.sh
echo "mount -t efs -o iam,tls,accesspoint=${nexus_accesspoint} ${filesystem}: /efs/nexus" >> /root/mount.sh
echo "mount -t efs -o iam,tls,accesspoint=${downloads_accesspoint} ${filesystem}: /efs/downloads" >> /root/mount.sh

chmod a+x /root/mount.sh
/root/mount.sh

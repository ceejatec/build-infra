    <com.cloudbees.jenkins.plugins.amazonecs.ECSCloud plugin="amazon-ecs@1.37">
      <name>${cloud_name}</name>
      <templates>

        <!-- clamav -->
        <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>
          <templateName>clamav_4CPU_8GB</templateName>
          <label>clamav</label>
          <taskDefinitionOverride>${task_prefix}-WORKER-server-build-clamav</taskDefinitionOverride>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <remoteFSRoot>/home/couchbase/jenkins</remoteFSRoot>
          <subnets>${subnets}</subnets>
          <securityGroups>${security_groups}</securityGroups>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <assignPublicIp>false</assignPublicIp>
          <taskrole></taskrole>
          <executionRole>${execution_role}</executionRole>
          <launchType>EC2</launchType>
          <networkMode>bridge</networkMode>
          <privileged>false</privileged>
          <uniqueRemoteFSRoot>false</uniqueRemoteFSRoot>
          <platformVersion>1.4.0</platformVersion>
          <logDriver>awslogs</logDriver>
          <logDriverOptions>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-group</name>
              <value>${cloudwatch_log_group}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-region</name>
              <value>${region}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-stream-prefix</name>
              <value>${cloudwatch_log_prefix}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
          </logDriverOptions>
        </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>

        <!-- ansible -->
        <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>
          <templateName>ansible_2CPU_4GB</templateName>
          <label>ansible-slave-server</label>
          <taskDefinitionOverride>${task_prefix}-WORKER-server-build-ansible</taskDefinitionOverride>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <remoteFSRoot>/home/couchbase/jenkins</remoteFSRoot>
          <subnets>${subnets}</subnets>
          <securityGroups>${security_groups}</securityGroups>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <assignPublicIp>false</assignPublicIp>
          <taskrole></taskrole>
          <executionRole>${execution_role}</executionRole>
          <launchType>EC2</launchType>
          <networkMode>bridge</networkMode>
          <privileged>false</privileged>
          <uniqueRemoteFSRoot>false</uniqueRemoteFSRoot>
          <platformVersion>1.4.0</platformVersion>
          <logDriver>awslogs</logDriver>
          <logDriverOptions>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-group</name>
              <value>${cloudwatch_log_group}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-region</name>
              <value>${region}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-stream-prefix</name>
              <value>${cloudwatch_log_prefix}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
          </logDriverOptions>
        </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>

        <!-- operator -->
        <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>
          <templateName>operator_4CPU_8GB</templateName>
          <label>couchbase-k8s-microservices couchbase-operator master</label>
          <taskDefinitionOverride>${task_prefix}-WORKER-server-build-operator-build</taskDefinitionOverride>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <remoteFSRoot>/home/couchbase/jenkins</remoteFSRoot>
          <subnets>${subnets}</subnets>
          <securityGroups>${security_groups}</securityGroups>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <assignPublicIp>false</assignPublicIp>
          <taskrole></taskrole>
          <executionRole>${execution_role}</executionRole>
          <launchType>EC2</launchType>
          <networkMode>bridge</networkMode>
          <privileged>false</privileged>
          <uniqueRemoteFSRoot>false</uniqueRemoteFSRoot>
          <platformVersion>1.4.0</platformVersion>
          <logDriver>awslogs</logDriver>
          <logDriverOptions>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-group</name>
              <value>${cloudwatch_log_group}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-region</name>
              <value>${region}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-stream-prefix</name>
              <value>${cloudwatch_log_prefix}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
          </logDriverOptions>
        </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>

        <!-- amazonlinux:2 -->
        <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>
          <templateName>amzn2_4CPU_8GB</templateName>
          <label>alice-amzn2 cheshire-cat-amzn2 mad-hatter-amzn2 master-amzn2</label>
          <taskDefinitionOverride>${task_prefix}-WORKER-server-build-amzn2</taskDefinitionOverride>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <remoteFSRoot>/home/couchbase/jenkins</remoteFSRoot>
          <subnets>${subnets}</subnets>
          <securityGroups>${security_groups}</securityGroups>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <assignPublicIp>false</assignPublicIp>
          <taskrole></taskrole>
          <executionRole>${execution_role}</executionRole>
          <launchType>EC2</launchType>
          <networkMode>bridge</networkMode>
          <privileged>false</privileged>
          <uniqueRemoteFSRoot>false</uniqueRemoteFSRoot>
          <platformVersion>1.4.0</platformVersion>
          <logDriver>awslogs</logDriver>
          <logDriverOptions>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-group</name>
              <value>${cloudwatch_log_group}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-region</name>
              <value>${region}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-stream-prefix</name>
              <value>${cloudwatch_log_prefix}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
          </logDriverOptions>
        </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>

        <!-- centos:7 -->
        <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>
          <templateName>centos7_4CPU_8GB</templateName>
          <label>alice-centos7 cheshire-cat-centos7 mad-hatter-centos7 master-centos7 vulcan-centos7</label>
          <taskDefinitionOverride>${task_prefix}-WORKER-server-build-centos7</taskDefinitionOverride>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <remoteFSRoot>/home/couchbase/jenkins</remoteFSRoot>
          <subnets>${subnets}</subnets>
          <securityGroups>${security_groups}</securityGroups>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <assignPublicIp>false</assignPublicIp>
          <taskrole></taskrole>
          <executionRole>${execution_role}</executionRole>
          <launchType>EC2</launchType>
          <networkMode>bridge</networkMode>
          <privileged>false</privileged>
          <uniqueRemoteFSRoot>false</uniqueRemoteFSRoot>
          <platformVersion>1.4.0</platformVersion>
          <logDriver>awslogs</logDriver>
          <logDriverOptions>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-group</name>
              <value>${cloudwatch_log_group}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-region</name>
              <value>${region}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-stream-prefix</name>
              <value>${cloudwatch_log_prefix}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
          </logDriverOptions>
        </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>

        <!-- centos:8 -->
        <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>
          <templateName>centos8_4CPU_8GB</templateName>
          <label>cheshire-cat-centos8 mad-hatter-centos8 master-centos8</label>
          <taskDefinitionOverride>${task_prefix}-WORKER-server-build-centos8</taskDefinitionOverride>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <remoteFSRoot>/home/couchbase/jenkins</remoteFSRoot>
          <subnets>${subnets}</subnets>
          <securityGroups>${security_groups}</securityGroups>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <assignPublicIp>false</assignPublicIp>
          <taskrole></taskrole>
          <executionRole>${execution_role}</executionRole>
          <launchType>EC2</launchType>
          <networkMode>bridge</networkMode>
          <privileged>false</privileged>
          <uniqueRemoteFSRoot>false</uniqueRemoteFSRoot>
          <platformVersion>1.4.0</platformVersion>
          <logDriver>awslogs</logDriver>
          <logDriverOptions>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-group</name>
              <value>${cloudwatch_log_group}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-region</name>
              <value>${region}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-stream-prefix</name>
              <value>${cloudwatch_log_prefix}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
          </logDriverOptions>
        </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>

        <!-- debian:8 -->
        <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>
          <templateName>debian8_4CPU_8GB</templateName>
          <label>mad-hatter-debian8 master-debian8 spock-debian8 vulcan-debian8</label>
          <taskDefinitionOverride>${task_prefix}-WORKER-server-build-debian8</taskDefinitionOverride>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <remoteFSRoot>/home/couchbase/jenkins</remoteFSRoot>
          <subnets>${subnets}</subnets>
          <securityGroups>${security_groups}</securityGroups>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <assignPublicIp>false</assignPublicIp>
          <taskrole></taskrole>
          <executionRole>${execution_role}</executionRole>
          <launchType>EC2</launchType>
          <networkMode>bridge</networkMode>
          <privileged>false</privileged>
          <uniqueRemoteFSRoot>false</uniqueRemoteFSRoot>
          <platformVersion>1.4.0</platformVersion>
          <logDriver>awslogs</logDriver>
          <logDriverOptions>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-group</name>
              <value>${cloudwatch_log_group}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-region</name>
              <value>${region}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-stream-prefix</name>
              <value>${cloudwatch_log_prefix}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
          </logDriverOptions>
        </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>

        <!-- debian-alice:8 -->
        <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>
          <templateName>alice_debian8_4CPU_8GB</templateName>
          <label>alice-debian8</label>
          <taskDefinitionOverride>${task_prefix}-WORKER-server-build-debian8-alice</taskDefinitionOverride>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <remoteFSRoot>/home/couchbase/jenkins</remoteFSRoot>
          <subnets>${subnets}</subnets>
          <securityGroups>${security_groups}</securityGroups>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <assignPublicIp>false</assignPublicIp>
          <taskrole></taskrole>
          <executionRole>${execution_role}</executionRole>
          <launchType>EC2</launchType>
          <networkMode>bridge</networkMode>
          <privileged>false</privileged>
          <uniqueRemoteFSRoot>false</uniqueRemoteFSRoot>
          <platformVersion>1.4.0</platformVersion>
          <logDriver>awslogs</logDriver>
          <logDriverOptions>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-group</name>
              <value>${cloudwatch_log_group}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-region</name>
              <value>${region}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-stream-prefix</name>
              <value>${cloudwatch_log_prefix}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
          </logDriverOptions>
        </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>

        <!-- debian:9 -->
        <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>
          <templateName>debian9_4CPU_8GB</templateName>
          <label>cheshire-cat-debian9 mad-hatter-debian9 master-debian9 spock-debian9 vulcan-debian9</label>
          <taskDefinitionOverride>${task_prefix}-WORKER-server-build-debian9</taskDefinitionOverride>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <remoteFSRoot>/home/couchbase/jenkins</remoteFSRoot>
          <subnets>${subnets}</subnets>
          <securityGroups>${security_groups}</securityGroups>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <assignPublicIp>false</assignPublicIp>
          <taskrole></taskrole>
          <executionRole>${execution_role}</executionRole>
          <launchType>EC2</launchType>
          <networkMode>bridge</networkMode>
          <privileged>false</privileged>
          <uniqueRemoteFSRoot>false</uniqueRemoteFSRoot>
          <platformVersion>1.4.0</platformVersion>
          <logDriver>awslogs</logDriver>
          <logDriverOptions>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-group</name>
              <value>${cloudwatch_log_group}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-region</name>
              <value>${region}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-stream-prefix</name>
              <value>${cloudwatch_log_prefix}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
          </logDriverOptions>
        </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>

        <!-- debian:10 -->
        <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>
          <templateName>debian10_4CPU_8GB</templateName>
          <label>cheshire-cat-debian10 mad-hatter-debian10 master-debian10</label>
          <taskDefinitionOverride>${task_prefix}-WORKER-server-build-debian10</taskDefinitionOverride>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <remoteFSRoot>/home/couchbase/jenkins</remoteFSRoot>
          <subnets>${subnets}</subnets>
          <securityGroups>${security_groups}</securityGroups>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <assignPublicIp>false</assignPublicIp>
          <taskrole></taskrole>
          <executionRole>${execution_role}</executionRole>
          <launchType>EC2</launchType>
          <networkMode>bridge</networkMode>
          <privileged>false</privileged>
          <uniqueRemoteFSRoot>false</uniqueRemoteFSRoot>
          <platformVersion>1.4.0</platformVersion>
          <logDriver>awslogs</logDriver>
          <logDriverOptions>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-group</name>
              <value>${cloudwatch_log_group}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-region</name>
              <value>${region}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-stream-prefix</name>
              <value>${cloudwatch_log_prefix}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
          </logDriverOptions>
        </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>

        <!-- suse:15 -->
        <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>
          <templateName>suse15_4CPU_8GB</templateName>
          <label>cheshire-cat-suse15 mad-hatter-suse15 master-suse15</label>
          <taskDefinitionOverride>${task_prefix}-WORKER-server-build-suse15</taskDefinitionOverride>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <remoteFSRoot>/home/couchbase/jenkins</remoteFSRoot>
          <subnets>${subnets}</subnets>
          <securityGroups>${security_groups}</securityGroups>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <assignPublicIp>false</assignPublicIp>
          <taskrole></taskrole>
          <executionRole>${execution_role}</executionRole>
          <launchType>EC2</launchType>
          <networkMode>bridge</networkMode>
          <privileged>false</privileged>
          <uniqueRemoteFSRoot>false</uniqueRemoteFSRoot>
          <platformVersion>1.4.0</platformVersion>
          <logDriver>awslogs</logDriver>
          <logDriverOptions>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-group</name>
              <value>${cloudwatch_log_group}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-region</name>
              <value>${region}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-stream-prefix</name>
              <value>${cloudwatch_log_prefix}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
          </logDriverOptions>
        </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>

        <!-- ubuntu:16 -->
        <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>
          <templateName>ubuntu16_4CPU_8GB</templateName>
          <label>alice-ubuntu16.04 cheshire-cat-ubuntu16.04 spock-ubuntu16.04 mad-hatter-ubuntu16.04 master-ubuntu16.04 vulcan-ubuntu16.04</label>
          <taskDefinitionOverride>${task_prefix}-WORKER-server-build-ubuntu16</taskDefinitionOverride>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <remoteFSRoot>/home/couchbase/jenkins</remoteFSRoot>
          <subnets>${subnets}</subnets>
          <securityGroups>${security_groups}</securityGroups>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <assignPublicIp>false</assignPublicIp>
          <taskrole></taskrole>
          <executionRole>${execution_role}</executionRole>
          <launchType>EC2</launchType>
          <networkMode>bridge</networkMode>
          <privileged>false</privileged>
          <uniqueRemoteFSRoot>false</uniqueRemoteFSRoot>
          <platformVersion>1.4.0</platformVersion>
          <logDriver>awslogs</logDriver>
          <logDriverOptions>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-group</name>
              <value>${cloudwatch_log_group}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-region</name>
              <value>${region}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-stream-prefix</name>
              <value>${cloudwatch_log_prefix}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
          </logDriverOptions>
        </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>

        <!-- ubuntu:18 -->
        <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>
          <templateName>ubuntu18_4CPU_8GB</templateName>
          <label>alice-ubuntu18.04 mad-hatter-ubuntu18.04 cheshire-cat-ubuntu18.04 master-ubuntu18.04</label>
          <taskDefinitionOverride>${task_prefix}-WORKER-server-build-ubuntu18</taskDefinitionOverride>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <remoteFSRoot>/home/couchbase/jenkins</remoteFSRoot>
          <subnets>${subnets}</subnets>
          <securityGroups>${security_groups}</securityGroups>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <assignPublicIp>false</assignPublicIp>
          <taskrole></taskrole>
          <executionRole>${execution_role}</executionRole>
          <launchType>EC2</launchType>
          <networkMode>bridge</networkMode>
          <privileged>false</privileged>
          <uniqueRemoteFSRoot>false</uniqueRemoteFSRoot>
          <platformVersion>1.4.0</platformVersion>
          <logDriver>awslogs</logDriver>
          <logDriverOptions>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-group</name>
              <value>${cloudwatch_log_group}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-region</name>
              <value>${region}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-stream-prefix</name>
              <value>${cloudwatch_log_prefix}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
          </logDriverOptions>
        </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>

        <!-- ubuntu:20 -->
        <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>
          <templateName>ubuntu20_4CPU_8GB</templateName>
          <label>cheshire-cat-ubuntu20.04 master-ubuntu20.04</label>
          <taskDefinitionOverride>${task_prefix}-WORKER-server-build-ubuntu20</taskDefinitionOverride>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <remoteFSRoot>/home/couchbase/jenkins</remoteFSRoot>
          <subnets>${subnets}</subnets>
          <securityGroups>${security_groups}</securityGroups>
          <defaultCapacityProvider>true</defaultCapacityProvider>
          <assignPublicIp>false</assignPublicIp>
          <taskrole></taskrole>
          <executionRole>${execution_role}</executionRole>
          <launchType>EC2</launchType>
          <networkMode>bridge</networkMode>
          <privileged>false</privileged>
          <uniqueRemoteFSRoot>false</uniqueRemoteFSRoot>
          <platformVersion>1.4.0</platformVersion>
          <logDriver>awslogs</logDriver>
          <logDriverOptions>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-group</name>
              <value>${cloudwatch_log_group}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-region</name>
              <value>${region}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
            <com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
              <name>awslogs-stream-prefix</name>
              <value>${cloudwatch_log_prefix}</value>
            </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate_-LogDriverOption>
          </logDriverOptions>
        </com.cloudbees.jenkins.plugins.amazonecs.ECSTaskTemplate>
      </templates>
      <credentialsId></credentialsId>
      <cluster>${cluster_arn}</cluster>
      <regionName>${region}</regionName>
      <tunnel>${jenkins_tunnel}</tunnel>
      <jenkinsUrl>${jenkins_url}</jenkinsUrl>
      <retainAgents>false</retainAgents>
      <retentionTimeout>0</retentionTimeout>
      <slaveTimeoutInSeconds>0</slaveTimeoutInSeconds>
      <taskPollingIntervalInSeconds>0</taskPollingIntervalInSeconds>
      <maxCpu>0</maxCpu>
      <maxMemory>0</maxMemory>
      <maxMemoryReservation>0</maxMemoryReservation>
    </com.cloudbees.jenkins.plugins.amazonecs.ECSCloud>

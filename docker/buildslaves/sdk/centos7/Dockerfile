# Docker container for Centos7

FROM centos:centos7.4.1708
MAINTAINER build-team@couchbase.com

USER root
RUN yum clean all && \
    yum install --setopt=keepcache=0 -y sudo deltarpm

# Create couchbase user with password-less sudo privs, and give
# ownership of /opt/couchbase
RUN groupadd -g1000 couchbase && \
    useradd couchbase -g couchbase -u1000 -G wheel -m -s /bin/bash && \
    mkdir /opt/couchbase && chown -R couchbase:couchbase /opt/couchbase && \
    echo 'couchbase:couchbase' | chpasswd && \
    echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/wheel_group && \
    echo 'Defaults:%wheel !requiretty' >> /etc/sudoers.d/wheel_group && \
    chmod 440 /etc/sudoers.d/wheel_group

# clean up nsswitch
RUN sed -ri 's/^hosts.*/hosts:      files dns/' /etc/nsswitch.conf

### Install Couchbase build dependencies ######################################
# * Packages from the base CentOS repository
# * CentOS SCLs for devtoolset-8 (devtoolset-9-gcc-c++),
#   more info at https://www.softwarecollections.org/en/scls/rhscl/devtoolset-8/
RUN yum install --setopt=keepcache=0 -y epel-release centos-release-scl && \
    yum install --setopt=keepcache=0 -y \
                bzip2-devel \
                cmake \
                cmake3 \
                ed \
                git \
                glibc.i686 \
                libev-devel \
                libevent-devel \
                libffi-devel \
                libicu \
                libunwind \
                libuv-devel \
                libxml2-devel \
                make \
                man \
                ncurses-devel \
                numactl-devel \
                openssl-devel \
                openssh-clients \
                perl-XML-XPath \
                python-devel \
                python-pip \
                python-virtualenv \
                redhat-lsb-core \
                rpm-build \
                ruby rubygems rubygem-rake \
                tar \
                unzip \
                wget \
                which \
                llvm-toolset-7.0 \
                llvm-toolset-7.0-clang-analyzer \
                llvm-toolset-7.0-clang-tools-extra \
                llvm-toolset-7.0-git-clang-format \
                devtoolset-9-gcc-c++

# Dev basic tools
RUN yum groupinstall -y --setopt=keepcache=0 "Development Tools"

# JDK for Jenkins
RUN yum install -y --setopt=keepcache=0 java-1.8.0-openjdk && yum clean packages

# Repo
RUN curl https://storage.googleapis.com/git-repo-downloads/repo \
    -o /usr/local/bin/repo && \
    chmod a+x /usr/local/bin/repo

# CMake
RUN mkdir /tmp/deploy && \
    curl -L https://cmake.org/files/v3.9/cmake-3.9.4-Linux-x86_64.sh -o /tmp/deploy/cmake.sh && \
    (echo y ; echo n) | sh /tmp/deploy/cmake.sh --prefix=/usr/local && \
    rm /usr/local/bin/cmake-gui && \
    rm -rf /tmp/deploy

# Jenkins Swarm client jar
RUN curl https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/3.8/swarm-client-3.8.jar -o /usr/local/lib/swarm-client.jar

# Ensure /opt/cbdeps is writable
RUN mkdir /opt/cbdeps && \
    chown couchbase:couchbase /opt/cbdeps && \
    chmod 755 /opt/cbdeps

# Build tools
RUN curl https://bintray.com/sbt/rpm/rpm > /etc/yum.repos.d/bintray-sbt-rpm.repo && \
    sudo yum install -y --setopt=keepcache=0 sbt
RUN mkdir /tmp/deploy && \
    curl -L -o /tmp/deploy/gradle.zip https://services.gradle.org/distributions/gradle-4.10-bin.zip && \
    curl -L -o /tmp/deploy/maven.zip http://apache.mirrors.tds.net/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.zip && \
    cd /usr/local && \
    unzip /tmp/deploy/gradle.zip && \
    unzip /tmp/deploy/maven.zip && \
    ln -s /usr/local/apache-maven-*/bin/mvn /usr/local/gradle-*/bin/gradle /usr/local/bin && \
    rm -rf /tmp/deploy

# libcouchbase
RUN mkdir /tmp/deploy && \
    cd /tmp/deploy && \
    curl -L -o couchbase-release.rpm http://packages.couchbase.com/releases/couchbase-release/couchbase-release-1.0-4-x86_64.rpm && \
    rpm -iv couchbase-release.rpm && \
    yum install -y --setopt=keepcache=0 libcouchbase-devel libcouchbase2-libevent libcouchbase2-libev libcouchbase2-bin && \
    cd /tmp && \
    rm -rf /tmp/deploy

# Temp install step for "cbdep" tool
ARG CACHEBUST=1
RUN curl https://s3.amazonaws.com/packages.couchbase.com/cbdep/cbdep-linux -o /usr/local/bin/cbdep && chmod 755 /usr/local/bin/cbdep

# Run our builder startup script
COPY build/couchbuilder_start.sh /usr/sbin/
ENTRYPOINT [ "/usr/sbin/couchbuilder_start.sh" ]
CMD [ "swarm" ]

# Ensure appropriate directories exist and are owned by 'couchbase'
USER couchbase
RUN mkdir /home/couchbase/.ssh

# Keep this stuff at the end, because the ARG declaration breaks Docker build caching
ARG CONTAINER_TAG_ARG
ENV CONTAINER_TAG=${CONTAINER_TAG_ARG}

# This Dockerfile exists only to update the Jenkins Swarm jar in the
# existing Docker image. We don't want to rebuild some of the older
# historic images and risk raising unexpected issues when rebuilding
# older releases.

FROM couchbasebuild/server-debian8-build:20201214

RUN curl \
    https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/3.17/swarm-client-3.17.jar \
    -o /usr/local/lib/swarm-client.jar
# Also need to update repo
RUN curl https://raw.githubusercontent.com/couchbasedeps/git-repo/repo-1-couchbase/repo -o /usr/local/bin/repo && \
    chmod a+x /usr/local/bin/repo

RUN rm -rf /home/couchbase/.ssh

COPY build/couchbuilder_start.sh /usr/sbin/
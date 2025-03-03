FROM jenkins/jenkins:lts-jdk17

# To-Do:
# Do not use root user for Jenkins.
# Left as is for convenience
USER root 

ARG LOCALSTACK_URL
ENV LOCALSTACK_URL=${LOCALSTACK_URL}

# To-Do:
# Could and should be inserted from somewhere else. Probably during runtime
ARG STAGING_URL
ENV STAGING_URL=${STAGING_URL}

# Python
RUN apt update -y  && \
    apt-get install -y wget jq build-essential checkinstall  libncursesw5-dev  libssl-dev  libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev && \
    cd /usr/src && \
    wget https://www.python.org/ftp/python/3.12.9/Python-3.12.9.tgz && \
    tar xzf Python-3.12.9.tgz && \
    cd Python-3.12.9 && \
    ./configure --enable-optimizations && \
    make altinstall

RUN python3.12 -m pip install -U pytest pytest-cov

# AWS (Localstack)
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

RUN echo "alias aws='aws --endpoint-url http://${LOCALSTACK_URL}' --no-sign-request" >> /root/.bashrc

# Jenkins
RUN jenkins-plugin-cli --plugins "pipeline-github-lib pipeline-stage-view git"


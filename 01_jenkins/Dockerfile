FROM jenkins/jenkins:lts-jdk17

# To-Do
USER root 

ARG LOCALSTACK_URL
ENV LOCALSTACK_URL=${LOCALSTACK_URL}

ARG STAGING_URL
ENV STAGING_URL=${STAGING_URL}

RUN apt update -y  && \
    apt-get install -y wget jq build-essential checkinstall  libncursesw5-dev  libssl-dev  libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev && \
    cd /usr/src && \
    wget https://www.python.org/ftp/python/3.12.9/Python-3.12.9.tgz && \
    tar xzf Python-3.12.9.tgz && \
    cd Python-3.12.9 && \
    ./configure --enable-optimizations && \
    make altinstall

RUN echo "alias python='python3.12'" >> /root/.bashrc
RUN echo "alias pip='python -m pip'" >> /root/.bashrc
RUN python3.12 -m pip install -U pytest pytest-cov

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

RUN echo "alias aws='aws --endpoint-url http://${LOCALSTACK_URL}' --no-sign-request" >> /root/.bashrc

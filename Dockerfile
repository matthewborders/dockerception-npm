FROM ubuntu:latest

# Install Docker prerequisites
RUN apt-get update -qq && apt-get install -qqy \
    curl \
    bash \
    linux-image-extra-$(uname -r) \
    apt-transport-https \
    ca-certificates \
    lxc \
    iptables

# Install Docker
RUN curl -sSL https://get.docker.com/ | sh

# Install Node and NPM
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
	apt-get update && apt-get install -y nodejs && \
	npm install npm@latest -g

ENTRYPOINT service docker start && /bin/bash

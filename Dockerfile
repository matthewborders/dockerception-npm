FROM ubuntu:latest

# Install curl and bash
RUN apt-get -qq update
RUN apt-get install -qqy curl bash

# Install extras for this distro
apt-get install linux-image-extra-$(uname -r)

# Install Docker prerequisites
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    lxc \
    iptables

# Install Node and NPM
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
	apt-get update && apt-get install -y nodejs && \
	npm install npm@latest -g

# Install Docker
RUN curl -sSL https://get.docker.com/ | sh

CMD ["service", "docker", "start"]

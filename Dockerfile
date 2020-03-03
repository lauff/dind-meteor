# FROM: https://github.com/Stieneee/docker-in-ubuntu/blob/master/Dockerfile
# EXPLAINED AT: https://tylerstiene.ca/blog/gitlab-ci-docker-build-meteor...-please/
# VERSIONS: Meteor v1.8 with Node v8

FROM ubuntu:latest

RUN apt-get update && \
   apt-get -y install \
   apt-transport-https \
   ca-certificates \
   curl \
   software-properties-common \
   sudo && \
   apt-get clean

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

RUN apt-get update && \
   apt-get -y install docker-ce && \
   apt-get clean


RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN apt-get update && \
   apt-get -y install nodejs build-essential git
   
RUN curl https://install.meteor.com/?release=1.8 | sh

RUN mkdir -p /tmp/meteor-build/

# assume --link docker:dind
ENV DOCKER_HOST tcp://docker:2375

FROM jenkins/jenkins:lts

USER root

#Extending image
FROM node:carbon

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install autoconf automake libtool nasm pkg-config git apt-utils

#create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

#versions
RUN npm -v
RUN node -v

# install app dependencies
COPY package.json /usr/src/app/
COPY package-lock.json /usr/src/app/

RUN npm install

#bundle app source
COPY . /usr/src/app

#env variables
ENV NODE_ENV test

#Main command
CMD [ "npm", "test" ]
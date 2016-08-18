FROM debian:jessie
MAINTAINER Ken <ken@mindnaked.com>

USER root

RUN apt-get update && apt-get install -y curl git

# Get the NoddeJS
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash
RUN apt-get install -y nodejs

# Pull down npm pakcages
RUN npm install -g grunt-cli karma jasmine

# Make a directry for deployment
RUN mkdir /var/www -p

# Switch to the working directory
WORKDIR /var/www
FROM ubuntu:latest

MAINTAINER Ken <ken@mindnaked.com>

ENV working_dir /var/www

USER root

RUN apt-get update && apt-get install -y curl git \
	bzip2 libfontconfig # For phanstomJS

# Get the NoddeJS
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash && \
	apt-get install -y nodejs

# Set the node path
RUN PATH=/usr/bin/node:$PATH

# Pull down some npm pakcages
RUN npm install -g grunt-cli karma-cli jasmine jasmine-core

# Pull down PhantomJS
RUN npm install phantomjs-prebuilt karma-phantomjs-launcher

# Make a directry for deployment
RUN mkdir $working_dir -p

# Switch to the working directory
WORKDIR $working_dir
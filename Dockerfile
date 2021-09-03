FROM node:14-alpine as node
FROM ruby:3.0.2

WORKDIR /workspace

RUN apt-get update && apt-get install -y npm

COPY /Gemfile /workspace/Gemfile
COPY /Gemfile.lock /workspace/Gemfile.lock
COPY /package.json /workspace/package.json
COPY /yarn.lock /workspace/yarn.lock

RUN gem install bundler -v "2.2.25"
RUN bundle install

RUN npm update
RUN npm install -g npm yarn@1.22.5

RUN yarn install

FROM node:12.18.4-alpine as node

########################################################################
# base
########################################################################
FROM ruby:2.7.3-alpine as base

WORKDIR /app

ENV BUNDLER_VERSION 2.1.4
ENV YARN_VERSION 1.22.5

COPY --from=node /usr/local/bin/node /usr/local/bin/

RUN apk add --update --no-cache npm

RUN gem install bundler --version ${BUNDLER_VERSION} \
  && npm update \
  && npm install -g npm yarn@${YARN_VERSION}

########################################################################
# development
########################################################################
FROM base as development

RUN apk add --update --no-cache \
    build-base \
    git \
    bash \
    less \
    postgresql-dev \
    imagemagick \
    openssl \
    openssh-client \
    tzdata \
    graphviz \
    msttcorefonts-installer \
    fontconfig \
    font-bitstream-type1 \
    ghostscript-fonts \
    ttf-freefont

RUN update-ms-fonts \
  && fc-cache -f \
  && rm -rf /var/cache/*

EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]

########################################################################
# builder
########################################################################
FROM base as builder

RUN apk add --update --no-cache --virtual build-dependencies \
    build-base \
    git \
    postgresql-dev \
    imagemagick \
    openssl

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install --jobs=4 --clean --force

COPY package.json /app/package.json
COPY yarn.lock /app/yarn.lock

RUN yarn install

RUN apk del --purge build-dependencies

########################################################################
# production
########################################################################
FROM base as production

RUN apk add --update --no-cache \
    build-base \
    git \
    bash \
    less \
    postgresql-dev \
    imagemagick \
    openssl \
    openssh-client \
    tzdata

COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /app/node_modules /app/node_modules

COPY . /app

RUN bundle exec rake assets:precompile

EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]

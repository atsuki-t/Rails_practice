FROM node:12.18.4-alpine as node

FROM ruby:2.7.3-alpine

WORKDIR /app

ENV BUNDLER_VERSION 2.1.4
ENV YARN_VERSION 1.22.5

COPY --from=node /usr/local/bin/node /usr/local/bin/

RUN apk add --update --no-cache \
  build-base \
  git \
  bash \
  npm \
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

RUN gem install bundler --version ${BUNDLER_VERSION} \
  && npm update \
  && npm install -g npm yarn@${YARN_VERSION}

RUN update-ms-fonts \
  && fc-cache -f \
  && rm -rf /var/cache/*

EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]

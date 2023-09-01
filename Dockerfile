FROM ruby:3.2.2-bullseye

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN apt-get update \
&&  apt-get install -y --no-install-recommends \
      build-essential \
      curl \
      openssl \
      bash \
      perl \
      findutils \
      default-mysql-client \
      default-libmysqlclient-dev \
      git \
&&  apt-get clean

RUN mkdir /stars
WORKDIR /stars

COPY Gemfile Gemfile.lock ./
RUN bundle install

ADD .

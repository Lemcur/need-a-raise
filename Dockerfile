FROM ruby:2.6.3

ENV BUNDLE_DISABLE_SHARED_GEMS true
ENV BUNDLE_PATH__SYSTEM false
ENV BUNDLE_JOBS 4
ENV WEB_CONCURRENCY 1
ENV RAILS_ENV development
ENV APP_HOME /cherry-trading
ENV HOME /root
ENV RAILS_SERVE_STATIC_FILES true

RUN mkdir /cherry-trading

WORKDIR $APP_HOME

COPY Gemfile /$APP_HOME/Gemfile
COPY Gemfile.lock /$APP_HOME/Gemfile.lock

RUN apt-get update && apt-get install -qq -y --fix-missing --no-install-recommends\
  git \
  curl \
  gnupg \
  dumb-init \
  build-essential \
  libpq-dev \
  imagemagick \
  gnupg2

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install --no-install-recommends yarn

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  apt-get install -y nodejs

RUN gem install bundler -v 2.0.2

COPY . /$APP_HOME

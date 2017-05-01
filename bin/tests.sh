#!/usr/bin/env bash
apt-get install nodejs
# ensure bundler is present
gem install bundler

# install dependencies and clean old ones at the same time
bundle install --clean

# make sure Postgres is available
until nc -z postgres 5432; do echo Waiting for Posgres; sleep 1; done

bundle exec rake db:drop db:create db:schema:load db:migrate
bundle exec rspec -fd

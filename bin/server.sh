#!/usr/bin/env bash

# ensure bundler is present
gem install bundler

# install dependencies and clean old ones at the same time
bundle install --clean

bundle exec rake db:create db:migrate db:seed

bundle exec rails s -b 0.0.0.0 -p 3000

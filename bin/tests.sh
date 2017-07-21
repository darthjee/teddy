#!/usr/bin/env bash

# make sure Postgres is available
until nc -z postgres 5432; do echo Waiting for Posgres; sleep 1; done
bundle exec rake db:drop db:create db:schema:load db:migrate

ARG=$1

if [ ! $ARG ]; then
  ARG=all
fi

function do_ci() {
  bundle exec rake jasmine:ci
}

function do_rspec() {
  bundle exec rspec -fd
}

function do_jasmine() {
  bundle exec rake jasmine
}

case $ARG in
  all)
    do_rspec
    do_ci
    ;;
  rspec)
    do_rspec
    ;;
  ci)
    do_ci
    ;;
  jasmine)
    do_jasmine
    ;;
  *)
    echo 'Usage: $0 <ci|rspec|jasmine>'
    ;;
esac

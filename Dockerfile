FROM ruby:2.4.0

RUN apt-get update && apt-get install -y netcat nodejs

WORKDIR /usr/src/app

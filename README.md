# Teddy
A bill schedule management

[![Code Climate](https://codeclimate.com/github/darthjee/teddy/badges/gpa.svg)](https://codeclimate.com/github/darthjee/teddy)
[![Test Coverage](https://codeclimate.com/github/darthjee/teddy/badges/coverage.svg)](https://codeclimate.com/github/darthjee/teddy/coverage)
[![Issue Count](https://codeclimate.com/github/darthjee/teddy/badges/issue_count.svg)](https://codeclimate.com/github/darthjee/teddy)

## Motivation

Bills needs to be paid before a due date, and sometimes they are handed by more than one person,
therefore, Some problems can occour:

 - A bill can be forgotten
 - A bill could be doubly paid
 - You might not understand where your money is going to

 This project tries to solve these issues

### Running
 You can run this project on your machine by having installed

 - [rvm](https://rvm.io/rvm/install) (or other ruby virtual machine)
 - ruby 2.4.0
 - postgresql >= 9.5

 then you can prepare using

 ```shell
 gem install bundler
 bundle install
 bundle exec rake db:create
 bundle exec rake db:seed
 ```

 and you can run using

 ```shell
 bundle exec rails s
 ```

 and access ```http://localhost:3000```
### Running using Docker

 Alternativily, you can run docker compose, for that you will need to have
 
 - [docker](https://docs.docker.com/engine/installation/)
 - [docker compose](https://docs.docker.com/compose/install/)

 then run

 ```shell
 docker-compose up teddy_app
 ```

 if you need to enter the console, run

 ```shell
 docker-compose run teddy_app bundle exec rails c
 ```

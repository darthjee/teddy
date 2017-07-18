FROM ruby:2.4.0

WORKDIR /home/app/teddy
ENV PATH "$PATH:/home/app/teddy/node_modules/phantomjs/lib/phantom/bin/"

RUN useradd -u 1000 app
RUN chown app.app /home/app
ADD Gemfile* /home/app/teddy/

RUN apt-get update && apt-get install -y netcat nodejs-legacy npm
RUN npm install bower -g
RUN npm install phantomjs
RUN gem install bundler
RUN bundle install --clean

USER app
ENV PATH "$PATH:/home/app/teddy/node_modules/phantomjs/lib/phantom/bin/"

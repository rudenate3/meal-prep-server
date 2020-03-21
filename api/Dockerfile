FROM ruby:2.7.0-alpine3.11

RUN apk --update add build-base nodejs tzdata mysql-dev libxslt-dev libxml2-dev imagemagick

COPY . .

WORKDIR /api

RUN gem install bundler

RUN bundle install

EXPOSE 3000

CMD ["sh", "./startup.sh"]
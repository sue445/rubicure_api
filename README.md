# RubicureAPI
API server for [Rubicure](https://github.com/sue445/rubicure)

https://rubicure.herokuapp.com/

[![Circle CI](https://circleci.com/gh/sue445/rubicure_api.svg?style=svg)](https://circleci.com/gh/sue445/rubicure_api)
[![Dependency Status](https://gemnasium.com/sue445/rubicure_api.svg)](https://gemnasium.com/sue445/rubicure_api)

## Requirements
* Ruby 2.2.3

## Setup
```sh
bundle install
```

## Run
```sh
bundle exec foreman s
open http://localhost:3000/
```

## Setup Heroku
```sh
heroku addons:create papertrail
heroku addons:create rollbar
heroku addons:create newrelic
heroku config:add ROLLBAR_ACCESS_TOKEN=XXXXXXXXXXXXXXX
heroku config:add NEW_RELIC_LICENSE_KEY=XXXXXXXXXXXXXXXX
```

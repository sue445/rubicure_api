source "https://rubygems.org"

ruby "2.6.3"

gem "activesupport"
gem "holiday_jp"
gem "icalendar"
gem "puma"
gem "puma-heroku"
gem "rollbar"
gem "rubicure"
gem "sinatra"
gem "sinatra-contrib"
gem "slim"

group :development do
  gem "foreman", require: false

  # TODO: Remove after https://github.com/onk/onkcop/pull/62 is merged
  # gem "onkcop", ">= 0.53.0.3", require: false
  gem "onkcop", require: false, github: "sue445/onkcop", branch: "rubocop_0.68.0"

  gem "rake", require: false
  gem "rubocop-performance", require: false
end

group :test do
  gem "rack-test"
  gem "test-unit"
  gem "timecop"
end

source "https://rubygems.org"
git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

ruby "2.6.5"

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

  # TODO: Remove after following PR are merged
  # * https://github.com/onk/onkcop/pull/62
  # * https://github.com/onk/onkcop/pull/63
  # * https://github.com/onk/onkcop/pull/65
  # gem "onkcop", ">= 0.53.0.3", require: false
  gem "onkcop", require: false, github: "sue445/onkcop", branch: "develop"

  gem "rake", require: false
  gem "rubocop-performance", require: false
end

group :test do
  gem "rack-test"
  gem "test-unit"
  gem "timecop"
end

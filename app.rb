require "sinatra"
require "sinatra/json"
require "slim"
require "yaml"
require "active_support/all"
require "rollbar/middleware/sinatra"
require "rubicure"

class App < Sinatra::Base
  use Rollbar::Middleware::Sinatra

  get "/" do
    @girls = Precure.all_stars
    @series = Precure.map(&:itself)
    slim :index
  end

  get "/series.json" do
    content_type :json

    # convert to plain Hash
    all_series = Precure.map{ |s| Hash[s] }

    json all_series
  end

  get "/series/:name.json" do
    name = params[:name].to_sym
    halt 404 unless Rubicure::Series.valid?(name)

    series = Rubicure::Series.find(name)

    json series
  end

  get "/girls.json" do
    girls = Precure.all_stars

    json girls
  end

  get "/girls/:name.json" do
    name = params[:name].to_sym
    halt 404 unless Rubicure::Girl.valid?(name)

    girl = Rubicure::Girl.find(name)

    json girl
  end
end

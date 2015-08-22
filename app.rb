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
    @series = Precure
    slim :index
  end

  get "/series.json" do
    series = Precure

    json series
  end

  get "/series/:name.json" do
    name = params[:name].to_sym
    halt 404 unless Rubicure::Series.valid?(name)

    series = Rubicure::Series.find(name)

    json series
  end
end

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
    @girls = Precure.all_stars.sort_by(&:girl_name)
    @series = Precure.map(&:itself)
    slim :index
  end

  get "/series.json" do
    content_type :json
    "[" + Precure.map(&:to_json).join(",") + "]"
  end

  get "/series/:name.json" do
    name = params[:name].to_sym
    halt 404 unless Rubicure::Series.valid?(name)

    series = Rubicure::Series.find(name)

    json series
  end

  get "/girls.json" do
    girls = Precure.all_stars.sort_by(&:girl_name)

    json girls
  end

  get "/girls/:name.json" do
    name = params[:name].to_sym
    halt 404 unless Rubicure::Girl.valid?(name)

    girl = Rubicure::Girl.find(name)

    json girl
  end
end

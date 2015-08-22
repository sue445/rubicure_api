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
    @series = Rubicure::Series.uniq_names.map { |name| series_with_name(name) }
    slim :index
  end

  get "/series.json" do
    series = Rubicure::Series.uniq_names.map { |name| series_with_name(name) }

    json series
  end

  get "/series/:name.json" do
    name = params[:name].to_sym
    halt 404 unless Rubicure::Series.valid?(name)

    json series_with_name(name)
  end

  helpers do
    def series_with_name(name)
      s = Rubicure::Series.find(name)
      {
        name:         name,
        title:        s.title,
        started_date: s.started_date,
        ended_date:   s.try(:ended_date),
      }
    end
  end
end

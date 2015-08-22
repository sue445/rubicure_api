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
    series = Rubicure::Series.uniq_names.map do |name|
      s = Rubicure::Series.find(name)
      {
        name:         name,
        title:        s.title,
        started_date: s.started_date,
        ended_date:   s.try(:ended_date),
      }
    end

    json series
  end

  get "/series/:name.json" do
    series = Rubicure::Series.find(params[:name])
    json series
  end
end

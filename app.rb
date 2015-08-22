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
end

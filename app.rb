require "sinatra"
require "sinatra/json"
require "slim"
require "yaml"
require "active_support/all"
require "rollbar/middleware/sinatra"

class App < Sinatra::Base
  use Rollbar::Middleware::Sinatra

  get "/" do
    slim :index
  end
end

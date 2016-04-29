require "sinatra"
require "sinatra/json"
require "slim"
require "yaml"
require "active_support/all"
require "rollbar/middleware/sinatra"
require "rubicure"

class Object
  def to_pretty_json
    JSON.pretty_generate(self)
  end
end

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

    json all_series, @json_options
  end

  get "/series/:name.json" do
    name = params[:name].to_sym
    halt 404 unless Rubicure::Series.valid?(name)

    series = Rubicure::Series.find(name)

    # convert to plain Hash
    json Hash[series], @json_options
  end

  get "/girls.json" do
    # convert to plain Hash
    girls = Precure.all_stars.map{ |g| Hash[g] }

    json girls, @json_options
  end

  get "/girls/:name.json" do
    name = params[:name].to_sym
    halt 404 unless Rubicure::Girl.valid?(name)

    girl = Rubicure::Girl.find(name)

    # convert to plain Hash
    json Hash[girl], @json_options
  end

  before do
    @json_options = {}
    @json_options[:json_encoder] = :to_pretty_json if params[:format] == "pretty"
  end
end

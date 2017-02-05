ENV["RACK_ENV"] = 'test'

require_relative "../app"
require "test/unit"
require "rack/test"
require "json"

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    App
  end

  test "GET /" do
    get "/"
    assert { last_response.ok? }
  end

  test "GET /series.json" do
    get "/series.json"
    assert { last_response.ok? }

    all_series = JSON.parse(last_response.body)
    assert { all_series.count == Rubicure::Series.uniq_names.count }

    first = all_series.first

    %w(series_name title started_date ended_date girls).each do |key|
      assert { first.key?(key) }
    end
  end

  Rubicure::Series.uniq_names.each do |series_name|
    test "GET /series/#{series_name}.json" do
      get "/series/#{series_name}.json"
      assert { last_response.ok? }
    end
  end

  test "GET /girls.json" do
    get "/girls.json"
    assert { last_response.ok? }

    girls = JSON.parse(last_response.body)
    assert { girls.count == Precure.all.count }
  end

  Precure.all.each do |girl|
    test "GET /girls/#{girl.girl_name}.json" do
      get "/girls/#{girl.girl_name}.json"
      assert { last_response.ok? }
    end
  end
end

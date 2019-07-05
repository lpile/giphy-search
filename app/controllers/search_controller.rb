class SearchController < ApplicationController
  def index
    @conn = Faraday.new(url: "https://api.giphy.com") do |faraday|
      faraday.params['api_key'] = ENV['api_key']
      faraday.params['q'] = params['q']
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/v1/gifs/search")

    results = JSON.parse(response.body, symbolize_names: true)[:data]

    @gifs = results[0..4].map do |result|
      Gif.new(result)
    end
  end
end

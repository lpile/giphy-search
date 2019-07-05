class GiphyService
  def search_data(q)
    params = {q: q, api_key: ENV['api_key']}
    fetch_data("/v1/gifs/search", params)
  end

  private

  def conn
    Faraday.new(url: "https://api.giphy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def fetch_data(url, params)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)[:data]
  end


end

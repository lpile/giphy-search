class GifSearchFacade
  def initialize(q)
    @q = q
  end

  def gif_count
    gifs.count
  end

  def gifs
    gif_data = giphy_service.search_data(q)
    gif_data[0..4].map do |gif|
      Gif.new(gif)
    end
  end

  private
  attr_reader :q

  def giphy_service
    GiphyService.new
  end

end

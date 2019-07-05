class Gif
  attr_reader :title, :id, :url, :gif

  def initialize(attributes = {})
    @title = attributes[:title]
    @id = attributes[:id]
    @url = attributes[:url]
    @gif = attributes[:images][:original][:url]
  end
end

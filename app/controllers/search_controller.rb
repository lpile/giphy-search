class SearchController < ApplicationController
  def index
    render locals: {
      facade: GifSearchFacade.new(params[:q])
    }
  end
end

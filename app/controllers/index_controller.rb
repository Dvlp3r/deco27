class IndexController < ApplicationController

  def index
    @images = []
    render "index"
  end

end

class GalleryController < ApplicationController
  def index
  	@gallery = Gallery.first
  	@photos = @gallery ? @gallery.gallery_images.page(params[:page]) : []
  end
end

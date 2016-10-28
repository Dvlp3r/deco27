class PostsController < ApplicationController
  def index
    # @posts = Post.all

    @gallery = Gallery.first
    @photos = @gallery ? @gallery.gallery_images.page(params[:page]) : []
  end
  
  def show
  	@post = Post.friendly.find(params[:id])
  end
end
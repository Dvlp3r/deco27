class ResultsController < ApplicationController
  def index
    @products = Product.where(id: PgSearch.multisearch(params[:search]).where(:searchable_type => "Product").map(&:searchable_id)).page params[:page]
    @categories = Category.where(id: PgSearch.multisearch(params[:search]).where(:searchable_type => "Category").map(&:searchable_id)).page params[:page]
  end
end
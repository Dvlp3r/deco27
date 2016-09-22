class ProductsController < ApplicationController
  before_action :set_category, only: [:show]

  def show
    @product = @category.products.friendly.find(params[:id])
    @related_products = @category.products.sample(3)
    @enquiry = Enquiry.new
  end

  def results
    @products = Product.search_by_name(params[:search]).page params[:page]
  end

  private
  def set_category
    @category = Category.friendly.find(params[:category_id])
  end
end

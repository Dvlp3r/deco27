class ProductsController < ApplicationController
  before_action :set_category, only: [:show, :index]

  def show
    @product = @category.products.friendly.find(params[:id])
    @related_products = @category.products.sample(3)
    @enquiry = Enquiry.new
  end

  def results
    @products = Product.search_by_name(params[:search]).page params[:page]
  end

  def index
    @parent_category = Category.roots.friendly.find(@category.root.slug)
    # @products = Product.of_children_categories(@category.descendant_ids << @category.id).order("#{params[:sort]} #{params[:order]}").page params[:page]
    @products = @category.products.page params[:page]
  end

  private
  def set_category
    @category = Category.includes(:products).friendly.find(params[:category_id])
  end
end

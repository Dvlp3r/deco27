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
    @products = Product.of_children_categories(@category.descendant_ids << @category.id).order("#{params[:sort]} #{params[:order]}").page params[:page]
    @refine_categories = @category.parent.try(:root?) ? @category.children.with_products : @category.siblings.with_products
    @left_menu_categories = if @parent_category.children.try(:first).try(:has_children?)
                              @parent_category.children.where(id: Category.with_products.map(&:parent_id))
                            else
                              @parent_category.children.with_products
                            end
  end

  private
  def set_category
    @category = Category.includes(:products).friendly.find(params[:category_id])
  end
end

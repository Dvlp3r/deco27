class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.roots
    # @products = Product.all#.reject{ |category| category.try(:products).blank? }.sample.try(:products)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    # @products = Product.of_children_categories(@category.descendant_ids << @category.id).order("#{params[:sort]} #{params[:order]}").page params[:page]
    @parent_category = Category.roots.friendly.find(@category.root.slug)
    @products = Product.of_children_categories(@category.descendant_ids << @category.id).order("#{params[:sort]} #{params[:order]}").page params[:page]
    @refine_categories = @category.parent.try(:root?) ? @category.children.with_products : @category.siblings.with_products
    @left_menu_categories = if @parent_category.children.try(:first).try(:has_children?)
                              @parent_category.children.where(id: Category.with_products.map(&:parent_id))
                            else
                              @parent_category.children.with_products
                            end
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.includes(:products).find_by_ancestry_slug(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :image)
    end
end

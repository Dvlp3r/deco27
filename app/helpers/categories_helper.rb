module CategoriesHelper
  def category_products_path(category)
  	super.gsub('%2F', '/')
  end

  def category_product_path(category, product)
  	super.gsub('%2F', '/')
  end
end

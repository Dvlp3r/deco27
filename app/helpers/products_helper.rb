module ProductsHelper
  def product_links(product)
  	count = product.categories.count
    links = product.categories.collect do |category|
              link_to("#{product.name} #{suffix(count, category.name)}", category_product_path(category.slug, product.slug))
            end
    links.join("<br>").html_safe    
  end

  private
  def suffix(count, name)
  	count > 1 ? "in #{name}" : ""
  end
end

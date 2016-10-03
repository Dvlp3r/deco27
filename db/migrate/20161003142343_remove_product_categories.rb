class RemoveProductCategories < ActiveRecord::Migration
  def up
  	drop_table :product_categories
  end

  def down
  	create_table :product_categories do |t|
      t.integer :product_id
      t.integer :category_id
    end
  end
end

class CreateProductCategory < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.integer :product_id
      t.integer :category_id
    end
  end

  def down
  	drop_table :product_categories
  end
end

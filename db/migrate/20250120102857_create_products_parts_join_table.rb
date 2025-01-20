class CreateProductsPartsJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_join_table :products, :parts do |t|
      t.index :product_id
      t.index :part_id
    end
  end
end

class DropPartsProducts < ActiveRecord::Migration[8.0]
  def change
    drop_table :parts_products
  end
end

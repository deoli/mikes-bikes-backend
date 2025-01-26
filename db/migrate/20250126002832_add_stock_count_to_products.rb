class AddStockCountToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :stock_count, :integer
  end
end

class RemoveStockCountFromProducts < ActiveRecord::Migration[8.0]
  def change
    remove_column :products, :stock_count, :integer
  end
end

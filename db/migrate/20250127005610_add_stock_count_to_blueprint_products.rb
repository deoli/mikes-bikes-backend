class AddStockCountToBlueprintProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :blueprint_products, :stock_count, :integer
  end
end

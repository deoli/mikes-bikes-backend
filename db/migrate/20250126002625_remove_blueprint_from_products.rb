class RemoveBlueprintFromProducts < ActiveRecord::Migration[8.0]
  def change
    remove_reference :products, :blueprint, null: false, foreign_key: true
  end
end

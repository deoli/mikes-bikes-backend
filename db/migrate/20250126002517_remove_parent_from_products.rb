class RemoveParentFromProducts < ActiveRecord::Migration[8.0]
  def change
    remove_reference :products, :parent, null: true, foreign_key: { to_table: :products }
  end
end

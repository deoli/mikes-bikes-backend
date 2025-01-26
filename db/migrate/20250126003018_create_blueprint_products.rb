class CreateBlueprintProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :blueprint_products do |t|
      t.references :parent, null: true, foreign_key: { to_table: :products }
      t.references :product, null: false, foreign_key: true
      t.references :blueprint, null: false, foreign_key: true

      t.timestamps
    end
  end
end

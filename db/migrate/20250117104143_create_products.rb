class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.references :parent, null: true, foreign_key: { to_table: :products }
      t.references :blueprint, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end

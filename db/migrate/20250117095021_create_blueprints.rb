class CreateBlueprints < ActiveRecord::Migration[8.0]
  def change
    create_table :blueprints do |t|
      t.references :parent, null: true, foreign_key: { to_table: :blueprints }
      t.string :name
      t.boolean :is_optional

      t.timestamps
    end
  end
end

class CreateParts < ActiveRecord::Migration[8.0]
  def change
    create_table :parts do |t|
      t.string :name
      t.string :code
      t.integer :stock_count

      t.timestamps
    end
  end
end

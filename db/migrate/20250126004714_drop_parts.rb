class DropParts < ActiveRecord::Migration[8.0]
  def change
    drop_table :parts
  end
end

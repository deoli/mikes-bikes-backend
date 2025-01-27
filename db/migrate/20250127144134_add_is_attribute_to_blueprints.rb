class AddIsAttributeToBlueprints < ActiveRecord::Migration[8.0]
  def change
    add_column :blueprints, :is_attribute, :boolean
  end
end

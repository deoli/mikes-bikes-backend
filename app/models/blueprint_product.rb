class BlueprintProduct < ApplicationRecord
  belongs_to :parent,
    class_name: "Product",
    optional: true
  belongs_to :product
  belongs_to :blueprint
end

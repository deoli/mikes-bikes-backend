class Product < ApplicationRecord
  include SelfJoin

  belongs_to :blueprint
  has_and_belongs_to_many :parts

  # Parent association
  belongs_to :parent,
             class_name: "Product",
             optional: true

  # Children association
  has_many :children,
           class_name: "Product",
           foreign_key: "parent_id",
           dependent: :destroy,
           inverse_of: :parent

  # Validation to prevent circular references
  validate :prevent_circular_reference
end

class Blueprint < ApplicationRecord
  include SelfJoin

  # Parent association
  belongs_to :parent,
             class_name: "Blueprint",
             optional: true

  # Children association
  has_many :children,
           class_name: "Blueprint",
           foreign_key: "parent_id",
           dependent: :destroy,
           inverse_of: :parent

  # Validation to prevent circular references
  validate :prevent_circular_reference
end

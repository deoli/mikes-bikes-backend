class Blueprint < ApplicationRecord
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

  private

  def prevent_circular_reference
    if id != nil && (parent_id == id ||
       (parent.present? && parent.ancestor_ids.include?(id)))
      errors.add(:parent_id, "cannot create circular reference")
    end
  end
end

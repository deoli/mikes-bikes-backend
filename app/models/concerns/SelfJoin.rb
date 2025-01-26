module SelfJoin
  extend ActiveSupport::Concern

  def root?
    parent_id.nil?
  end

  def ancestor_ids
    return [] if root?
    [ parent_id ] + parent.ancestor_ids
  end

  private

  def prevent_circular_reference
    if id != nil && (parent_id == id ||
        (parent.present? && parent.ancestor_ids.include?(id)))
      errors.add(:parent_id, "cannot create circular reference")
    end
  end
end

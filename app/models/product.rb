class Product < ActiveRecord::Base
  has_many :line_items
  has_many :images
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :shopify_variant_id, presence: true

  private
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end

class Product < ActiveRecord::Base
  has_many :line_items
  has_many :images
  has_many :product_ingredients, dependent: :destroy
  has_many :ingredients, through: :product_ingredients
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :shopify_variant_id, presence: true
  store :metadata, accessors: [:instructor, :instructor_description]

  def resolve_shopify
    # Grab shopify variant and parent product
    shopify_variant = ShopifyAPI::Variant.find(self.shopify_variant_id)
    shopify_product = ShopifyAPI::Product.find(shopify_variant.product_id)

    # Merge shopify attrs into this model
    self.title = shopify_variant.title
    self.price = shopify_variant.price
    self.shopify_product_id = shopify_variant.product_id
    product_id = self.id

    # Create image models for each shopify image
    shopify_product.images.each do |img|
      image = Image.where(shopify_id: img.id).first_or_initialize
      image.shopify_url = img.src
      image.product_id = product_id
      image.product = self
      image.save
    end

    return self
  end

  def sync_products
  end

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

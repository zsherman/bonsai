class AddShopifyVariantIdToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :shopify_variant_id, :string
  end
end

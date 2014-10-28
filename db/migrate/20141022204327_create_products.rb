class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :video_url
      t.decimal :price
      t.integer :shopify_product_id
      t.integer :shopify_variant_id
      t.text :metadata
      t.timestamps
    end
  end
end

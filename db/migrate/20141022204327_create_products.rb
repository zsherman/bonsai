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
      t.string :instructor_name
      t.string :instructor_description
      t.text :metadata
      t.timestamps
    end
  end
end

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
      t.text :instructor_description
      t.string :story_headline
      t.string :story_image_url
      t.text :story_description
      t.text :metadata
      t.timestamps
    end
  end
end

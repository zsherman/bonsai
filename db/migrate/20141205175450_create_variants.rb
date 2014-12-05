class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.references :product
      t.string :shopify_variant_id
      t.decimal :price
      t.string :title
      t.string :description
      t.string :image_url
      t.timestamps
    end
  end
end

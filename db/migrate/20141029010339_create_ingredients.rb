class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.integer :shopify_variant_id
      t.string :image_url
      t.timestamps
    end
  end
end

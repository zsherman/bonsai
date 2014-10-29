class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :description
      t.integer :shopify_variant_id
      t.timestamps
    end
  end
end
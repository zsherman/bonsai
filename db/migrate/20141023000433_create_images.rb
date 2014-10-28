class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :product
      t.string :shopify_url
      t.integer :shopify_id
      t.boolean :featured
      t.timestamps
    end
  end
end

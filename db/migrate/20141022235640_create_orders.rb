class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :cart
      t.references :user
      t.integer :shopify_id
      t.decimal :total_price
      t.timestamps
    end
  end
end

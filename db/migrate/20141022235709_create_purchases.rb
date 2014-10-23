class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :user
      t.timestamps
    end
  end
end

class CreateUnlockCodes < ActiveRecord::Migration
  def change
    create_table :unlock_codes do |t|
      t.references :user
      t.references :product
      t.string :code
      t.integer :uses
      t.integer :max_uses
      t.boolean :used, default: false
      t.timestamps
    end
  end
end

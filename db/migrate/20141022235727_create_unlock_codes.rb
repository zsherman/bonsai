class CreateUnlockCodes < ActiveRecord::Migration
  def change
    create_table :unlock_codes do |t|
      t.references :user
      t.references :product
      t.timestamps
    end
  end
end

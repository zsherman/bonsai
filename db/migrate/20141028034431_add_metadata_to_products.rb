class AddMetadataToProducts < ActiveRecord::Migration
  def change
    add_column :products, :metadata, :text
  end
end

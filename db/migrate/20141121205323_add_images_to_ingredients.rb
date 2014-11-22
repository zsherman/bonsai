class AddImagesToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :image_url, :string
  end
end

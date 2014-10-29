class Ingredient < ActiveRecord::Base
  has_many :product_ingredients, dependent: :destroy
  has_many :products, through: :product_ingredients
end

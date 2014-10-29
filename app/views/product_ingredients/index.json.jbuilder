json.array!(@product_ingredients) do |product_ingredient|
  json.extract! product_ingredient, :id
  json.url product_ingredient_url(product_ingredient, format: :json)
end

shop_url = "https://#{ENV["SHOPIFY_API_KEY"]}:#{ENV["SHOPIFY_API_PASSWORD"]}@bonsai-box.myshopify.com/admin"
ShopifyAPI::Base.site = shop_url
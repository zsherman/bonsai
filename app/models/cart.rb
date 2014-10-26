class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  attr_accessor :shopify_cart_url

  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(:product_id => product_id)
    end
    current_item
  end

  def remove_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    current_item.destroy
  end

  def decrement_product(product_id)
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def build_cart_url(current_user, current_cart)
    # Looks like
    # http://bonsai-box.myshopify.com/cart/917108355:1?attributes[user-id]=1&attributes[cart-id]=1
    return '' unless line_items.count >= 1

    # Set the shop url base
    url = 'http://bonsai-box.myshopify.com/cart/'

    # Add the info & quantity for each product
    line_items.each do |item|
      url += item.product.shopify_variant_id.to_s
      url += ":#{item.quantity.to_s},"
    end

    # Pass along the user and cart ids
    url += "?attributes[user_id]=#{current_user.id.to_s}"
    url += "&attributes[cart_id]=#{current_cart.id.to_s}"

    # Format and return the final url
    shopify_cart_url = "<a href=#{url}>Check Out</a>"
  end

end

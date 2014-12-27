class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :variant

  def total_price
    if variant != nil
      variant.price * quantity
    else
      product.price * quantity
    end
  end

end

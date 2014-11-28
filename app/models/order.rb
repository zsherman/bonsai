class Order < ActiveRecord::Base
  validates :shopify_id, presence: true
  attr_accessor :cart_id, :user_id, :total_price

  def self.sync_orders
    # Set shopify shop
    shop = ShopifyAPI::Shop.current

    # How far back do we want to reach?
    range = Time.now - 60.minutes

    # Grab the orders
    orders = ShopifyAPI::Order.find(:all, params: {created_at_min: range, order: "created_at DESC" })

    # Find or create records for each order
    # Todo: handle errors so correct orders still get executed
    # Todo: handle case where user_id is nil i.e. for gift purchase
    begin
      orders.each do |o|
        order_attributes = o.note_attributes
        order = Order.where(shopify_id: o.id).first_or_initialize
        # Iterate through shopify note attrs and persist them
        order_attributes.each do |a|
          attribute = a.name
          order[attribute] = a.value
        end
        order.total_price = o.total_price
        order.save
      end
    # Triggered if shopify has a note attr that the model does not
    rescue ActiveModel::MissingAttributeError
      logger.info "Mismatched attributes"
    end
  end

end

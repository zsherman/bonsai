class Order < ActiveRecord::Base
  validates :shopify_id, presence: true
end

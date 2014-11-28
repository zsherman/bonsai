class Course < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :product
  has_many :lessons

  def unlocked?(user)
    !UnlockCode.where(product: self.product, user: user).empty?
  end

  protected

end

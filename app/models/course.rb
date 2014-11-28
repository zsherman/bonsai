class Course < ActiveRecord::Base
  belongs_to :product
  has_many :lessons

  def unlocked?(user)
    !UnlockCode.where(product: self.product, user: user).empty?
  end

  protected

end

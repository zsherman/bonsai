class Course < ActiveRecord::Base
  belongs_to :product
  has_many :videos
end

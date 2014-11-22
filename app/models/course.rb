class Course < ActiveRecord::Base
  belongs_to :product
  has_many :lessons
end

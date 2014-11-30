class Lesson < ActiveRecord::Base
  belongs_to :course
  has_one :video
end

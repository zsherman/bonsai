class CoursePolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user || {}
    @course = model
  end

  def show?
    puts "Course:"
    puts @course
    @current_user.admin? or @course.unlocked?(@current_user)
  end

end

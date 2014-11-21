class RegistrationsController < Devise::RegistrationsController

  def new
    @header = false
    @footer = false
    super
  end

end
class RegistrationsController < Devise::RegistrationsController

  def new
    @header = false
    super
  end

end
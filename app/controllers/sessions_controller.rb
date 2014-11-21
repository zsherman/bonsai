class SessionsController < Devise::SessionsController

  # GET /users/sign_in
  def new
    @header = false;
    @footer = false;
    @classes = "sign-in"
    super
  end

end
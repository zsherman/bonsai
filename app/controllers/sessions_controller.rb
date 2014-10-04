class SessionsController < Devise::SessionsController

  # GET /users/sign_in
  def new
    @header = false;
    super
  end

end
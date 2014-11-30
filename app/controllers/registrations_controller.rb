class RegistrationsController < Devise::RegistrationsController

  def new
    @header = false
    @footer = false
    @classes = "register-wrapper"
    if params[:from_twitter]
      @classes += " from-twitter"
    end
    super
  end

  def edit
    @header = false
    @footer = false
    @classes = "register-wrapper"
    super
  end

  def create
    @header = false
    @footer = false
    @classes = "register-wrapper"
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end
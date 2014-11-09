class UsersController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized, except: [:dashboard]

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def dashboard
    @user = current_user
    @courses = []
    @user.unlock_codes.each do |code|
      @courses << code.product.courses.first
    end
    @courses = @courses.uniq{|x| x.id}
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

end

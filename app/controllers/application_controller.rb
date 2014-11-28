class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_cart

  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
    rescue ActionController::RedirectBackError
      redirect_to '/', :alert => "Access denied."
  end

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def current_cart
    cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
  end

  def pundit_user
    return current_user
  end

  # def current_cart
  #   https://github.com/railscasts/145-integrating-active-merchant
  #   if session[:cart_id]
  #     @current_cart ||= Cart.find(session[:cart_id])
  #     session[:cart_id] = nil if @current_cart.purchased_at
  #   end
  #   if session[:cart_id].nil?
  #     @current_cart = Cart.create!
  #     session[:cart_id] = @current_cart.id
  #   end
  #   @current_cart
  # end

end

class PagesController < ApplicationController

  def home
    if current_user
      redirect_to edit_user_registration_path
    end
  end

  def boxes
  end

end

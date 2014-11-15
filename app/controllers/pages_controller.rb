class PagesController < ApplicationController

  def home
    if current_user
      redirect_to products_path
    end
  end

  def boxes
    redirect_to products_path
  end

end

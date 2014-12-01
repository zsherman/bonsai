class PagesController < ApplicationController

  def home
    @classes = 'landing'
  end

  def boxes
    redirect_to products_path
  end

  def mission
  end

  def team
  end

  def terms
  end

  def privacy
  end

  def refund
  end

end

class SiteController < ApplicationController
  def home
    redirect_to home_path if current_user
  end
end

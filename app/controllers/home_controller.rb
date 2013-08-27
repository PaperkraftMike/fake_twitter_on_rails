class HomeController < ApplicationController
  def index
    if !current_user.nil?
      @user = User.find(session[:user_id])
    end
  end
end